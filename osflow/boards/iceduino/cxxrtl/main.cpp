#include <iostream>
#include <fstream>
#include <string>
#include <regex>

#include <cxxrtl/cxxrtl_vcd.h>
#include "iceduino.cpp"

using namespace std;

// parses option e.g. "-time=10ms" and returns the simulation time in s
// if format incorrect return negative val
float parse_simtime_arg(const std::string& arg, int& time_val, std::string& unit) {
    std::regex pattern(R"(-time=(\d+)([a-zA-Z]+))");
    std::smatch match;
    float simtime_seconds = -1;

    if (std::regex_match(arg, match, pattern) && match.size() == 3) {
        time_val = std::stoi(match[1].str()); 
        unit = match[2].str();                 
        if (unit == "ns") {
            simtime_seconds = time_val / 1e9; 
        } else if (unit == "us") {
            simtime_seconds = time_val / 1e6;
        } else if (unit == "ms") {
            simtime_seconds = time_val / 1e3;
        } else if (unit == "s") {
            simtime_seconds = time_val;
        }
    }

    return simtime_seconds;
}

int main(int argc, char *argv[]){
    int time_val;
    string unit;

    float simtime_in_s = parse_simtime_arg(argv[1], time_val, unit);

    if (argc > 1 && simtime_in_s > 0) {
        std::cout << "Simulation time: " << time_val << unit << "\n";
    } else {
        std::cerr << "Invalid argument format. Expected format: -time=<value><unit>\n";
    }

    char* end;

    int simtime_in_ms = strtol(argv[1], &end, 10);
    int clkrate = 50000000;
    int simsteps = (int)(clkrate * simtime_in_s);  

    cxxrtl_design::p_neorv32__iceduino__top top;

    // -------- VCD RELEVANT STUFF --------

    // debug_items maps the hierarchical names of signals and memories in the design
    // to a cxxrtl_object (a value, a wire, or a memory)
    cxxrtl::debug_items all_debug_items;
    cxxrtl::debug_scopes scopes;
    std::string path;

    // Load the debug items of the top down the whole design hierarchy
    top.debug_info(&all_debug_items, &scopes, path);

    cxxrtl::vcd_writer vcd;
    vcd.timescale(10, "ns");

    // Here we tell the vcd writer to dump all the signals of the design, except for the
    // memories, to the VCD file.
    //
    // It's not necessary to load all debug objects to the VCD. There is, for example,
    // a  vcd.add(<debug items>, <filter>)) method which allows creating your custom filter to decide
    // what to add and what not.
    // vcd.add_without_memories(all_debug_items);
    vcd.add(all_debug_items);
    std::ofstream waves("waves.vcd");

    // -------- VCD RELEVANT STUFF --------

    bool prev_out = 0;
    int steps = 0;
    top.step();

    // We need to manually tell the VCD writer when sample and write out the traced items.
    // This is only a slight inconvenience and allows for complete flexibilty.
    // E.g. you could only start waveform tracing when an internal signal has reached some specific
    // value etc.
    // !! Interessant in Bezug auf SOPCs und vernachlässigbaren aber aufwändig zu simulierenden Simulationsabschnitten , wie IP-Core Initialisierungen etc.
    // VCD Dumping in Datei erzeugt Performance-Overhead
    vcd.sample(0);

    while(steps < simsteps){

        top.p_clk__50mhz.set<bool>(false);
        top.step();
        vcd.sample(steps*2 + 0);

        top.p_clk__50mhz.set<bool>(true);
        top.step();
        vcd.sample(steps*2 + 1);

        waves << vcd.buffer;
        vcd.buffer.clear();

        steps ++;
    }
}
