#playing with graphs homie 

node dog {

    has name = "black boy";

}

edge big;
edge small;

walker init {

    dog1 = spawn here -[big]-> node::dog(name="brown boy");
    dog2 = spawn here -[big]-> node::dog;
    dog3 = spawn here -[small]-> node::dog;
    dog4 = spawn here -[small]-> node::dog(name="snoopy");


    dog1 <--> dog2;
    dog3 <-[big]->dog4;


    for i in -->:
        std.out(i.context);



}