library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity binarization is
    Generic (
        THRESHOLD: integer := 128 
    );
    Port (
        aclk: in STD_LOGIC;
        aresetn: in STD_LOGIC;

        -- intrare inspre DMA / PS
        s_axis_tdata: in STD_LOGIC_VECTOR (7 downto 0); -- 8 bit grayscale
        s_axis_tvalid: in STD_LOGIC;
        s_axis_tready: out STD_LOGIC;
        s_axis_tlast: in STD_LOGIC;

        -- iesire spre DMA / PS
        m_axis_tdata: out STD_LOGIC_VECTOR (7 downto 0);
        m_axis_tvalid: out STD_LOGIC;
        m_axis_tready: in STD_LOGIC;
        m_axis_tlast: out STD_LOGIC
    );
end binarization;

architecture Behavioral of binarization is
begin
    -- logica de handshake (Flow Control)

    s_axis_tready <= m_axis_tready;

    -- date valide la intrare => date valide la iesire
    m_axis_tvalid <= s_axis_tvalid;

    -- sa se semnaleze last
    m_axis_tlast  <= s_axis_tlast;

    --binarizare
    process(s_axis_tdata)
    begin
        if unsigned(s_axis_tdata) > to_unsigned(THRESHOLD, 8) then
            m_axis_tdata <= x"FF"; -- 255 (Alb)
        else
            m_axis_tdata <= x"00"; -- 0 (Negru)
        end if;
    end process;

end Behavioral;