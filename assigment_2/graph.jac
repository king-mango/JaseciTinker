node question {
    has title;
    has messgae;
    has prompts;
    has root;

}

edge transition{ 
    has intent ;
}

graph main_graph {
    has anchor main_root

    spawn {
        main_root = spawn node::state(
            title = "Welcome",
            message = "How can ACME help you?"
            prompts = ["office hours"]
        );

        office_hours = spawn main_root -[transition(intent="office hours")] ->node::state(
            title ="Office Hours",
            message = "The Salon is open from 8am to 6pm everyday except Sunday, which has no class",
            prompts  = []

        );

        x = spawn main_root -[transition(intent="x")] ->node::state(
            title ="x",
            message = "x",
            prompts  = []

        );

        phone_number = spawn main_root -[transition(intent="phone number")] ->node::state(
            title ="Phone Number",
            message = "Our numbers are 222-3333 and 654-3210",
            prompts  = []

        );

        payment_methods = spawn main_root -[transition(intent="payment methods")] ->node::state(
            title ="Payment Methods",
            message = "We prefer cash but you can pay with MMG",
            prompts  = []

        );

        email_address = spawn main_root -[transition(intent="Email Address")] ->node::state(
            title ="Email Address",
            message = "Our email is acme@gmail.com",
            prompts  = []

        );

        promotions = spawn main_root -[transition(intent="promotions")] ->node::state(
            title ="Promotions",
            message = "Every Mother's day we give a free pedicure to any mother who brings their kids to help clean the Salon",
            prompts  = []

        );


    }
}