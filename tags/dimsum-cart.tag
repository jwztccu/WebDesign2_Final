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
        message = 'Congratulations! You are correct.';
      } else {
        message = 'Ai yah! Try the next question.';
      }

      that.update();

    });

    nextQuestion() {

      currentQuestion = currentQuestion + 1;
      selectedAnswer = false;

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
      gameStarted = true;
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
  <br/>
  <audio id='audio'/>

  <div if={showIntroduction}>
    <h2>Learn to order Dim Sum - select the dim sum that you hear.</h2>
     <button onclick={playGame}>Start Game - I &#10084; Dim Sum</button>
  <!--start of sweet and savoury buttons tag-->
  </div>

  <div if={gameStarted}>
    <font face=arial size=5 color="purple">
        <h2>Score: { currentScore }</h2>
    </font>

    <h2>Select the Dim Sum that you hear</h2>
    <div if={!selectedAnswer}>
      <dimsum-eggtart></dimsum-eggtart>
      <dimsum-noodleroll></dimsum-noodleroll>
      <dimsum-potsticker></dimsum-potsticker>
    </div>

    <div if={selectedAnswer}>
      <h2>{message}</h2>
      <button onclick={nextQuestion}>Next Question</button>
    </div>
  </div>

  <div if={gameEnded}>
    <h2>Thanks for playing - do you want to try again?</h2>
    <font face=arial size=5 color="purple">
        <h2>Score: { currentScore }</h2>
    </font>
    <button onclick={playGame}>Start Game - I &#10084; Dim Sum</button>
  <!--start of sweet and savoury buttons tag-->
  </div>
<!--end of riot tags-->
</center>
</dimsum-cart>
