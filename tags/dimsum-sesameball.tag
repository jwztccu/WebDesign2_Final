<dimsum-sesameball>
    <img src="images/dimsum_sesameball.png" onclick={selectDimSum}>
    <br>

    <script>
       selectDimSum() {
         observable.trigger('dimsum-selected', 'sesameball');
       }
    </script>
</dimsum-sesameball>
