<dimsum-eggtart>
    <img src="images/dimsum_dahntaht_eggtart.png" onclick={selectDimSum}>
    <br>

    <script>
       selectDimSum() {
         observable.trigger('dimsum-selected', 'dahntaht');
       }
    </script>
</dimsum-eggtart>
