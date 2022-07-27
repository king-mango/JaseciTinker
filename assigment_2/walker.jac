walker talker{
    has uterance = "";
    can use.enc_question , use.enc_answer;


    question {
        
        std.out(here.message,here.prompts);

        utterance =  std.input("> ");

        if(utterance =="quit"){

            disengage;
        }

        else {

            question{
            q_enc =use.enc_question(utterance);
            a_enc = use.enc_answer(here.prompts);

            qa_scores = {};
            cf_threshold = 0.2;
            cf_max = 0;
            chosen_intent = "";

            for i=0 to i<(here.prompts).length by i += 1 {

                cf = vector.cosine_sim(q_enc,a_enc[i]);

                qa_scores[here.prompts[i]] = cf;

                if (cf > cf_max && cf >= cf_threshold){
                    cf_max = cf;
                    chosen_intent = here.prompts[i];
                }
                
            }
            take-[transition(intent==chosen_intent)] -> node::question else{
                    take here ;
                }
            
          
            }



        }






    }






    
}