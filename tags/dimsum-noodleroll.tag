<dimsum-noodleroll>
    <img src="images/dimsum_gnowcherng_beefnoodleroll.png" onclick={selectDimSum}>
    <br />

    <script>
       console.log('noodle rolle')
       selectDimSum() {
         observable.trigger('dimsum-selected', 'gnowcherng');
       }
    </script>
</dimsum-noodleroll>
