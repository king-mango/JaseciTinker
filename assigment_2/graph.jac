node question {
    has title;
    has message;
    has prompts;
    has root;

}

edge transition{ 
    has intent ;
}

graph main_graph {
    has anchor main_root;

    spawn {
        main_root = spawn node::question(
            title = "Welcome",
            message = "How can ACME help you?",
            prompts = ["office hours","services","workers","phone number","payment methods","Email Address","promotions"]
        );

        office_hours = spawn main_root -[transition(intent="office hours")] ->node::question(
            title ="Office Hours",
            message = "The Salon is open from 8am to 6pm everyday except Sunday, which has no class",
            prompts  = ["There is none"]

        );

        x = spawn main_root -[transition(intent="services")] ->node::question(
            title ="services",
            message = "we wash,colour and delouse your hair",
            prompts  = ["There is none"]

        );

        phone_number = spawn main_root -[transition(intent="phone number")] ->node::question(
            title ="Phone Number",
            message = "Our numbers are 222-3333 and 654-3210",
            prompts  = ["There is none"]

        );

        payment_methods = spawn main_root -[transition(intent="payment methods")] ->node::question(
            title ="Payment Methods",
            message = "We prefer cash but you can pay with MMG",
            prompts  = ["There is none"]

        );

        email_address = spawn main_root -[transition(intent="Email Address")] ->node::question(
            title ="Email Address",
            message = "Our email is acme@gmail.com",
            prompts  = ["there is none"]

        );

        promotions = spawn main_root -[transition(intent="promotions")] ->node::question(
            title ="Promotions",
            message = "Every Mother's day we give a free pedicure to any mother who brings their kids to help clean the Salon",
            prompts  = ["There is none"]

        );


    }
}