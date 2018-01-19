# function to generate random probablity to send message
random_send <- function() sample(c(0,1), size = 1, replace = TRUE, prob = c(0.4, 0.6))

# function to generate random probablity to generate new message
random_generate <- function() sample(c(0,1), size = 1, replace = TRUE, prob = c(0.8, 0.2))


ALOHAnetwork <- function(){

    sample_size = 50000
    # node a and node b both have messages at epoch 0
    count <- 0
    for (i in 1:sample_size){
        a <- 1
        b <- 1
        a.send <- FALSE
        b.send <- FALSE
        transmission_attempts <- 0
        # if(a = 0 & random_generate) a <- 1
        # if(b = 0 & random_generate) b <- 1
        if(a == 1 && random_send()){
            a <- 0
            transmission_attempts <- transmission_attempts + 1
            a.send <- TRUE
        }
        if(b == 1 && random_send()){
            b <- 0
            transmission_attempts <- transmission_attempts + 1
            b.send <- TRUE
        }
        if (a.send && b.send){
            a <- 1
            b <- 1
        }
        if (transmission_attempts != 2){
            a.send <- FALSE
            b.send <- FALSE

            if(a == 0 && random_generate()) a <- 1
            if(b == 0 && random_generate()) b <- 1

            if(a == 1 && random_send()){
                a <- 0
                transmission_attempts <- transmission_attempts + 1
                a.send <- TRUE
            }
            if(b == 1 && random_send()){
                b <- 0
                transmission_attempts <- transmission_attempts + 1
                b.send <- TRUE
            }
            # if (a.send & b.send){
            #     transmission_attempts <- transmission_attempts - 2
            #     a <- 1
            #     b <- 1
            # }

            if (transmission_attempts == 2 && (a.send | b.send)) count <- count + 1


        }

    
    }
    print(count/sample_size)
}


ALOHAnetwork()
