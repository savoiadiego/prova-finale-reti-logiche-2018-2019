library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity project_reti_logiche is
    Port ( i_clk : in STD_LOGIC;
           i_start : in STD_LOGIC;
           i_rst : in STD_LOGIC;
           i_data : in STD_LOGIC_VECTOR(7 downto 0);
           o_address : out STD_LOGIC_VECTOR(15 downto 0);
           o_done : out STD_LOGIC;
           o_en : out STD_LOGIC;
           o_we : out STD_LOGIC;
           o_data : out STD_LOGIC_VECTOR(7 downto 0));
end project_reti_logiche;

architecture Behavioral of project_reti_logiche is
signal mask : STD_LOGIC_VECTOR(7 downto 0);
signal tmp1 : STD_LOGIC_VECTOR(7 downto 0);
signal tmp2 : STD_LOGIC_VECTOR(7 downto 0);
signal tmp3 : STD_LOGIC_VECTOR(7 downto 0);
signal tmp4 : STD_LOGIC_VECTOR(7 downto 0);
signal tmp5 : STD_LOGIC_VECTOR(7 downto 0);
signal tmp6 : STD_LOGIC_VECTOR(7 downto 0);
signal tmp7 : STD_LOGIC_VECTOR(7 downto 0);
signal tmp8 : STD_LOGIC_VECTOR(7 downto 0);
signal tmp9 : STD_LOGIC_VECTOR(7 downto 0);
signal tmp10 : STD_LOGIC_VECTOR(7 downto 0);
signal tmp11 : STD_LOGIC_VECTOR(7 downto 0);
signal tmp12 : STD_LOGIC_VECTOR(7 downto 0);
signal tmp13 : STD_LOGIC_VECTOR(7 downto 0);
signal tmp14 : STD_LOGIC_VECTOR(7 downto 0);
signal tmp15 : STD_LOGIC_VECTOR(7 downto 0);
signal tmp16 : STD_LOGIC_VECTOR(7 downto 0);
signal pX : STD_LOGIC_VECTOR(7 downto 0);
signal pY : STD_LOGIC_VECTOR(7 downto 0);

signal first : STD_LOGIC_VECTOR(4 downto 0) := "00000";


begin
    progetto : process(i_clk, i_rst)
        variable dist : INTEGER;
        variable distMin : INTEGER;
        variable usc : STD_LOGIC_VECTOR(7 downto 0);
    begin
        if i_rst = '0' then
            if i_start = '1' then
              if rising_edge(i_clk) then  
                
                if first = "00000" then
                    usc := "00000000";                                     --inizializzazione
                    o_en <= '1';
                    o_we <= '0';
                    o_address <= "0000000000000000";
                    first <= "00001";
                end if;
                
                if first = "00001" then
                    o_address <= "0000000000000001";
                    first <= "00010";
                end if;
                
                if first = "00010" then
                    mask <= i_data;
                    o_address <= "0000000000000010";
                    first <= "00011";
                end if;
                
                if first = "00011" then
                    tmp1 <= i_data;
                    o_address <= "0000000000000011";
                    first <= "00100";
                end if;
                
                if first = "00100" then
                    tmp2 <= i_data;
                    o_address <= "0000000000000100";
                    first <= "00101";
                end if;
                
                if first = "00101" then
                    tmp3 <= i_data;
                    o_address <= "0000000000000101";
                    first <= "00110";
                end if;
                
                if first = "00110" then
                    tmp4 <= i_data;
                    o_address <= "0000000000000110";
                    first <= "00111";
                end if;
                
                if first = "00111" then
                    tmp5 <= i_data;
                    o_address <= "0000000000000111";
                    first <= "01000";
                end if;
                
                if first = "01000" then
                    tmp6 <= i_data;
                    o_address <= "0000000000001000";
                    first <= "01001";
                end if;
                
                if first = "01001" then
                    tmp7 <= i_data;
                    o_address <= "0000000000001001";
                    first <= "01010";
                end if;
                
                if first = "01010" then
                    tmp8 <= i_data;
                    o_address <= "0000000000001010";
                    first <= "01011";
                end if;
                
                if first = "01011" then
                    tmp9 <= i_data;
                    o_address <= "0000000000001011";
                    first <= "01100";
                end if;
                
                if first = "01100" then
                    tmp10 <= i_data;
                    o_address <= "0000000000001100";
                    first <= "01101";
                end if;
                
                if first = "01101" then
                    tmp11 <= i_data;
                    o_address <= "0000000000001101";
                    first <= "01110";
                end if;
                
                if first = "01110" then
                    tmp12 <= i_data;
                    o_address <= "0000000000001110";
                    first <= "01111";
                end if;
                
                if first = "01111" then
                    tmp13 <= i_data;
                    o_address <= "0000000000001111";
                    first <= "10000";
                end if;
                
                if first = "10000" then
                    tmp14 <= i_data;
                    o_address <= "0000000000010000";
                    first <= "10001";
                end if;
                
                if first = "10001" then
                    tmp15 <= i_data;
                    o_address <= "0000000000010001";
                    first <= "10010";
                end if;
                
                if first = "10010" then
                    tmp16 <= i_data;
                    o_address <= "0000000000010010";
                    first <= "10011";
                end if;
                
                if first = "10011" then
                    pX <= i_data;
                    o_address <= "0000000000010011";
                    first <= "10100";
                end if;
                
                if first = "10100" then
                    pY <= i_data;
                    o_we <= '1';
                    first <= "10101";
                end if;    
                
                
                if first = "10101" then
                    distMin := 512;
                    
                    if mask(0) = '1' then
                        dist := abs(conv_integer(pX) - conv_integer(tmp1)) + abs(conv_integer(pY) - conv_integer(tmp2));    --calcolo in INTEGER (vale per tutti)
                        if dist < distMin then
                            distMin := dist;
                            usc := "00000001";
                        elsif dist = distMin then
                            usc(0) := '1';
                        end if;
                    end if;
                 
                 
                    if mask(1) = '1' then
                        dist := abs(conv_integer(pX) - conv_integer(tmp3)) + abs(conv_integer(pY) - conv_integer(tmp4));
                        if dist < distMin then
                            distMin := dist;
                            usc := "00000010";
                        elsif dist = distMin then
                            usc(1) := '1';
                        end if;
                    end if;
                 
                 
                    if mask(2) = '1' then
                        dist := abs(conv_integer(pX) - conv_integer(tmp5)) + abs(conv_integer(pY) - conv_integer(tmp6));
                        if dist < distMin then
                            distMin := dist;
                            usc := "00000100";
                        elsif dist = distMin then
                            usc(2) := '1';
                        end if;
                    end if;
                 
                 
                    if mask(3) = '1' then
                        dist := abs(conv_integer(pX) - conv_integer(tmp7)) + abs(conv_integer(pY) - conv_integer(tmp8));
                        if dist < distMin then
                            distMin := dist;
                            usc := "00001000";
                        elsif dist = distMin then
                            usc(3) := '1';
                        end if;
                    end if;
                 
                 
                    if mask(4) = '1' then
                        dist := abs(conv_integer(pX) - conv_integer(tmp9)) + abs(conv_integer(pY) - conv_integer(tmp10));
                        if dist < distMin then
                            distMin := dist;
                            usc := "00010000";
                        elsif dist = distMin then
                            usc(4) := '1';
                        end if;
                    end if;
                 
                 
                    if mask(5) = '1' then
                        dist := abs(conv_integer(pX) - conv_integer(tmp11)) + abs(conv_integer(pY) - conv_integer(tmp12));
                        if dist < distMin then
                            distMin := dist;
                            usc := "00100000";
                        elsif dist = distMin then
                            usc(5) := '1';
                        end if;
                    end if;
                 
                 
                    if mask(6) = '1' then
                        dist := abs(conv_integer(pX) - conv_integer(tmp13)) + abs(conv_integer(pY) - conv_integer(tmp14));
                        if dist < distMin then
                            distMin := dist;
                            usc := "01000000";
                        elsif dist = distMin then
                            usc(6) := '1';
                        end if;
                    end if;
                 
                 
                    if mask(7) = '1' then
                        dist := abs(conv_integer(pX) - conv_integer(tmp15)) + abs(conv_integer(pY) - conv_integer(tmp16));
                        if dist < distMin then
                            distMin := dist;
                            usc := "10000000";
                        elsif dist = distMin then
                            usc(7) := '1';
                        end if;
                    end if;
                 
                 
                    o_data <= usc;           
                    first <= "10110";
                end if;
                
                if first = "10110" then -- porto a 1 o_done, solo dopo aver scritto la maschera d'uscita in memoria
                    o_done <= '1';
                end if; 
              end if;  
            end if;
            
            if i_start = '0' then
                o_done <= '0';
            end if; 
          end if; 
          
               
        if i_rst = '1' then
            first <= "00000";
            o_en <= '0';
            o_we <= '0';
        end if;    
    end process;        
end architecture;