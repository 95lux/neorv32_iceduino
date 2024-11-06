library IEEE;
use IEEE.std_logic_1164.all;

library iceduino;

entity iceduino_ws2812_top is
    generic (
        ws2812_dpram_addr : std_ulogic_vector(31 downto 0)
    );
    port(
        clk_i  : in std_ulogic; -- global clock line
        rstn_i : in std_ulogic; -- global reset line, low-active
        --wishbone-
        adr_i : in std_ulogic_vector(31 downto 0);
        dat_i : in std_ulogic_vector(31 downto 0); --write to slave
        dat_o : out std_ulogic_vector(31 downto 0);
        we_i  : in std_ulogic;
        stb_i : in std_ulogic;
        cyc_i : in std_ulogic;
        ack_o : out std_ulogic;
        err_o : out std_ulogic;
        ws2812_dout : out std_logic
    );
end iceduino_ws2812_top;

architecture iceduino_ws2812_top_rtl of iceduino_ws2812_top is
    
    -- wishbone
    signal module_active : std_ulogic;
    signal module_addr : std_ulogic_vector(31 downto 0);
    
    -- signals



    signal ram_write_en : std_logic;
    signal ram_waddr    : std_logic_vector(7 downto 0); 
    -- signal ram_wclk     : std_logic;
    signal ram_raddr    : std_logic_vector(7 downto 0); 
    -- signal ram_rclk     : std_logic; 
    signal ram_din      : std_logic_vector(7 downto 0);
    signal ram_dout     : std_logic_vector(7 downto 0);

begin
        -- module active
    module_active <= '1' when ((adr_i(31 downto 8) = ws2812_dpram_addr(31 downto 8)) and (cyc_i = '1' and stb_i = '1')) else
        '0';
    module_addr <= adr_i;


    -- instanatiations
    RAMtoWS2812_inst: entity iceduino.RAMtoWS2812
    port map(
        clk        =>  clk_i,
        din        =>  ram_dout,
        addr       =>  ram_raddr,
        ws2812_out =>  ws2812_dout
    );

    ram_inst: entity iceduino.ram
    generic map(
        addr_width => 8,
        data_width => 8
    )
    port map(
        write_en => ram_write_en,
        waddr    => ram_waddr,
        wclk     => clk_i,
        raddr    => ram_raddr,
        rclk     => clk_i,
        din      => ram_din,
        dout     => ram_dout
    );
    
    -- pass down module_active to converter to only enable dpram write, when wb module is active
    wishbone_dpram_converter : entity iceduino.iceduino_ws2812_dpram_converter
    port map(
        clk_i   => clk_i,
        rstn_i  => rstn_i, 
        --wishbone-
        adr_i   => adr_i, 
        dat_i   => dat_i, 
        dat_o   => dat_o, 
        we_i    => we_i,  
        module_active => module_active,
        dat_dp_o => ram_din,     
        we_dp_o => ram_write_en,
        addr_dp_o => ram_waddr
    );

    w_access : process (clk_i)
    begin
        if rising_edge(clk_i) then
            -- handshake
            err_o <= '0';
            if (module_active = '1') then
                ack_o <= '1';
            else
                ack_o <= '0';
            end if;
        end if;
    end process w_access;

end architecture;