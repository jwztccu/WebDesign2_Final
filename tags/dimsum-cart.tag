<dimsum-cart>
<center>
    <!--start of sweet and savoury buttons tag-->

  <!--START OF AUTHENTICATION FROM ADMIN TAG -->
  <!--<admin> -->


  <script>

    showIntroduction = true;
    gameStarted = false;
    gameEnded = false;

     var questions = [
       {
         question: 'images/dimsum_dahntaht_eggtart_pronounciation.m4a',
         answer: 'dahntaht'
       },
       {
         question: 'images/dimsum_gnowcherng_beefnoodleroll_pronounciation.m4a',
         answer: 'gnowcherng'
       },
       {
         question: 'images/dimsum_potstickers_pronounciation.m4a',
         answer: 'potsticker'
       }
     ];

    var that = this;
    that.update();

    console.log('dimsum-cart.tag');
    observable.on('dimsum-selected', function(selection) {

      selectedAnswer = true;
      if (questions[currentQuestion].answer == selection) {
        // correct answer
        currentScore = currentScore + 1;
        message = "Congratulations! You are correct.";
      } else {
        message = "Sorry that's incorrect! Try the next question.";
      }

      that.update();

    });

    nextQuestion() {

      currentQuestion = currentQuestion + 1;
      selectedAnswer = false;
      message = '';

      if (currentQuestion == questions.length ) {
        gameEnded = true;
        gameStarted = false;
        that.update();
      } else {
        that.update();
        playAudio(questions[currentQuestion].question);
      }
    }

    playGame() {
      console.log('play game started');
      currentScore = 0;
      currentQuestion = 0;
      showIntroduction = false;
      gameEnded = false;

      that.update();

      playAudio(questions[currentQuestion].question);
    }

    function playAudio(audioFile) {
       var audio = document.getElementById('audio');
       audio.src = audioFile;
       audio.play();
    }



  </script>
  <!--scripts end-->
  <br>
  <audio id='audio'/>



  <div>

        <p align="right">Score: { currentScore }</p>

      <!--start of riot tags-->
      <!--start of bootstrap columns-->


      <div class="container-fluid">
          <div class="row">
            <!--start column 1-->
        <div class="col-sm-1 col-md-4" style="background-color:;">
      <dimsum-eggtart></dimsum-eggtart> 
      <dimsum-noodleroll></dimsum-noodleroll>
      </div>
      <!--end column 1-->

      <!--start column 1b-->
  <div class="col-sm-1 col-md-4" style="background-color:; padding-right:20px; border-right: 3px solid #eee;">
<dimsum-potsticker></dimsum-potsticker>
</div>
<!--end column 1b-->


        <!--start column 2-->
      <div class="col-sm-3 col-md-6" style="background-color:;">
<!--start of intro-->
        <div if={showIntroduction}>
          <h1> &#10084; Learn to order Dim Sum&#10084;</h1>
          <h2><br>
            Instructions: Click on the image of the dim sum dish you hear.</h2>
           <button onclick={playGame}>Start Game</button>
        </div>
        <!--end of intro-->

  <!--start of if game ended-->
        <div if={gameEnded}>
          <h2>Thanks for playing - do you want to try again?</h2>

              <h2>Score: { currentScore }</h2>

          <button onclick={playGame}>Start Game - I &#10084; Dim Sum</button>

        </div>
          <!--ended of if game ended-->
       { message }
         <button  if={selectedAnswer} onclick={nextQuestion}>Next Question</button>
      </div>
      <!--end column 2-->
      </div>
      </div>
      <!--end of riot tags-->



  </div>


<!--end of riot tags-->
</center>
</dimsum-cart>
