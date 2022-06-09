walker init {
        # when using external libraries we use the (can) keyword to load them in to the program.
        can use.enc_question , use.enc_answer;


        answers = ['I am 20 years old' , 'My dog is hungry','My TV is broken'];
        question = "If i wanted to fix something what should i fix ?";


        q_enc = use.enc_question(question);
        a_enc  = use.enc_answer(answers); # can take list or single strings

        a_scores = [];

        for i in a_enc:

            a_scores.l::append(vector.cosine_sim(q_enc,i));

            report a_scores;


}