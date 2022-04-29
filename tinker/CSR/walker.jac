walker talker {
    has utterance;
    can use.enc_question, use.enc_answer;


    state {
        std.out(here.message,here.prompts);

        utterance = std.input("> ");

        if(utterance == "quit"): disengage;

        q_enc = use.enc_questions

        take -[transition(intent ==utterance)]-> node::state else {
            take here ;
        }
    }
}