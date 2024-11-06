library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity WS2812_aserial is
  port (
    reset      : in std_ulogic;
    clk        : in std_ulogic;
    wnr        : in std_ulogic;  -- write data_in val to internal register
    data_in    : in std_ulogic;  -- Das zu sendende Bit
    ws2812_out : out std_ulogic; -- Serieller Ausgang WS2812
    run        : out std_ulogic
  );
end WS2812_aserial;

architecture behv of WS2812_aserial is

  type state_type is (IDLE, RUNNING);
  signal state : state_type;

  -- signale
  signal cnt : integer := 0;
  signal threshold : integer := 18;

  constant max_cnt : integer := 62;

begin
  process (Clk) is
  begin
    if rising_edge(Clk) then
      case state is
        when IDLE =>
          -- counter
          cnt <= 0;

          -- state change
          if wnr = '1' then
            state <= RUNNING;
          end if;
        when RUNNING =>
          -- counter
          cnt <= cnt + 1;

          -- state change
          -- max_cnt - 1 ,weil durch DFF eine Clock-Versatz entsteht 
          if reset = '1' or cnt >= max_cnt - 1 then
            state <= IDLE;
          end if;
      end case;
    end if;
  end process;

  -- Kombinatorische Signalzuweisungen
  ws2812_out <= '1' when state = RUNNING and cnt < threshold and reset = '0' else
    '0';
  threshold <= 45 when data_in = '1' else
    18;
  run <= '1' when (cnt < (max_cnt - 1) and cnt /= 0) else
    '0';

end behv;