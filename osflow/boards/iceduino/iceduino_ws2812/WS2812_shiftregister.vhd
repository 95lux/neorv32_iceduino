library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity WS2812_shiftregister is
  port (
    clk : in std_logic;

    sfr_din   : in std_ulogic_vector(7 downto 0);
    sfr_rst   : in std_logic;
    sfr_shift : in std_logic;
    sfr_load  : in std_logic;

    sfr_done   : out std_logic;
    sfr_serout : out std_logic
  );
end;
architecture slicing of WS2812_shiftregister is

  type state_type is (IDLE, LOADING, SHIFTING);
  signal state : state_type;
  constant sfr_size : integer := 7;

  signal sr : std_ulogic_vector(sfr_size downto 0) := (others => '0');
  signal cnt : integer := 0;

begin

  process (clk)
  begin
    if rising_edge(clk) then
      case state is
        when IDLE =>

          if sfr_load = '1' then
            state <= LOADING;
          end if;
          if sfr_shift = '1' then
            state <= SHIFTING;
          end if;
        when LOADING =>
          sfr_done <= '0';
          cnt <= 0;

          sr <= sfr_din;
          if sfr_shift = '1' then
            state <= SHIFTING;
          else 
            state <= IDLE;
          end if;
        when SHIFTING =>
          sr <= sr(sr'high - 1 downto sr'low) & '0';
          sfr_serout <= sr(sr'high);

          -- increment counter and generate done signal
          -- done is generated, when last bit of register has been shifted out
          if cnt < sfr_size then
            sfr_done <= '0';
            cnt <= cnt + 1;
          else
            sfr_done <= '1';
          end if;
          
          state <= IDLE;

      end case;

    end if;
  end process;

end architecture slicing;