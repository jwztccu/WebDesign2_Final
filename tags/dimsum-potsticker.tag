<dimsum-potsticker>
    <img src="images/dimsum_potsticker.png" onclick={selectDimSum}>
    <br />

    <script>
       selectDimSum() {
         observable.trigger('dimsum-selected', 'potsticker');
       }
    </script>
</dimsum-potsticker>
