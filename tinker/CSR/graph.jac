node state {
    has title;
    has message;
    has prompts;
}

node has_input:state{
    has input;
}


node closing_state:state;


edge transition{
    has intent;
}

graph main_graph {
    has anchor main_root;

    spawn {

        main_root = spawn node::state(title="Welcome",message="Sup homie , what can i build for you?",prompts=["Website","Mobile App","Information Systems","quit"]);
        
        website = spawn main_root -[transition(intent="Website")]-> node::state(
            title= "Website",
            message= "What kind of website would you like ?",
            prompts = ["one-pager","five page","custom site","back"]
        );

        main_root -[transition(intent="website")]-> website;

        one_pager = spawn website -[transition(intent="one pager")]->node::state(
            title = "One pager",
            message = "What does your one pager site about?",
            prompts = ["A cause","me","pet"]
        );

        website -[transition(intent="one pager")]-> one_pager;

        mobile_app = spawn main_root -[transition(intent="Mobile App")]-> node::state(
            title ="Mobile App",
            message = "What kind of Mobile App would you like to build?",
            prompts = ["game","social","customes","back","quit"]
        );

        main_root -[transition(intent="Mobile App")]->mobile_app;

        Information_System = spawn main_root -[transition(intent="Information Systems")] -> node::state(
            title ="Information Systems",
            message = "What kind of Information System do you want?",
            prompts = ["school","Work"]

        );

        main_root -[transition(intent="Information Systems")]-> Information_System;





        





    }
}

