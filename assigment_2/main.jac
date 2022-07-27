import {*} with "./graph.jac";
import {*} with "./walker.jac";

walker init {
    
    root {
        spawn here --> graph::main_graph;
        spawn  --> walker::talker;
    }

}