
# Iniciando a simulacao
vsim work.top_timer_de2_115

# Adicionando os sinais de clock e reset
add wave -position insertpoint  \
sim:/top_timer_de2_115/t0/clk \
sim:/top_timer_de2_115/KEY 

# Adicionando os sinais com "radix" unsigned
add wave -position insertpoint -radix unsigned \
sim:/top_timer_de2_115/minT \
sim:/top_timer_de2_115/minU \
sim:/top_timer_de2_115/secT \
sim:/top_timer_de2_115/secU \
sim:/top_timer_de2_115/t0/r_reg \
sim:/top_timer_de2_115/t0/s_reg \
sim:/top_timer_de2_115/t0/m_reg 

# Criando clock e forçando reset
force -freeze sim:/top_timer_de2_115/t0/clk 1 0, 0 {10000 ps} -r 20ns
force -freeze sim:/top_timer_de2_115/KEY 0 0 
run 40ns
force -freeze sim:/top_timer_de2_115/KEY 1 0 
run 40ns


# Forcando alguns valores de borda para verificar o funcionamento
force -freeze sim:/top_timer_de2_115/t0/r_reg 10#39999 0 -cancel 20ns
run 200ns
force -freeze sim:/top_timer_de2_115/t0/r_reg 10#39999 0 -cancel 20ns
run 200ns
force -freeze sim:/top_timer_de2_115/t0/r_reg 10#39999 0 -cancel 20ns
run 200ns
force -freeze sim:/top_timer_de2_115/t0/r_reg 10#39999 0 -cancel 20ns
force -freeze sim:/top_timer_de2_115/t0/s_reg 10#59 0 -cancel 20ns
run 200ns
force -freeze sim:/top_timer_de2_115/t0/r_reg 10#39999 0 -cancel 20ns
force -freeze sim:/top_timer_de2_115/t0/s_reg 10#59 0 -cancel 20ns
run 200ns
force -freeze sim:/top_timer_de2_115/t0/r_reg 10#39999 0 -cancel 20ns
force -freeze sim:/top_timer_de2_115/t0/s_reg 10#59 0 -cancel 20ns
run 200ns
