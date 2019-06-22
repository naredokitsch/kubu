        identification division.
        program-id. e1-pgmmov.
        author. noe-uriel.

        environment division.
        input-output section.
        file-control.

        select movimientos-input-file assign to "movimientos.dat"
        organization is line sequential.

        select movimientos-output-file assign to "movimientos_ord.dat"
        organization is line sequential.

        select movimientos-work-file assign to "movimientos_work.dat"
        organization is line sequential.

        data division.
        file section.

        fd movimientos-output-file.
        01 e1-movimientos.
          05 e1-no-mts-mts pic 9(13).
          05 e1-no-cte-mts pic 9(10).
          05 e1-cta-chq-mts pic 9(13).
          05 e1-cta-cbe-mts pic 9(20).
          05 e1-tipo-mts pic A(8).
          05 e1-sdo-mts pic S9(10)V99.
          05 e1-fech-mts pic 9(8).

        fd movimientos-input-file.
        01 in-movimientos.
          05 in-no-mts-mts pic 9(13).
          05 in-no-cte-mts pic 9(10).
          05 in-cta-chq-mts pic 9(13).
          05 in-cta-cbe-mts pic 9(20).
          05 in-tipo-mts pic A(8).
          05 in-sdo-mts pic S9(10)V99.
          05 in-fech-mts pic 9(8).

        sd movimientos-work-file.
        01 wk-movimientos.
          05 wk-no-mts-mts pic 9(13).
          05 wk-no-cte-mts pic 9(10).
          05 wk-cta-chq-mts pic 9(13).
          05 wk-cta-cbe-mts pic 9(20).
          05 wk-tipo-mts pic A(8).
          05 wk-sdo-mts pic S9(10)V99.
          05 wk-fech-mts pic 9(8).

        procedure division.
          sort movimientos-work-file on ascending key e1-no-cte-mts
          using movimientos-input-file giving movimientos-output-file.
          display "movimientos ordenados".
        stop run.
