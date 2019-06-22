        identification division.
        program-id. e1-pgmmov.
        author. noe-uriel.

        environment division.
        input-output section.
        file-control.

        select clientes-input-file assign to "clientes.dat"
        organization is line sequential.

        select clientes-output-file assign to "clientes_ord.dat"
        organization is line sequential.

        select clientes-work-file assign to "clientes_work.dat"
        organization is line sequential.

        data division.
        file section.

        fd clientes-input-file.
        01 in-clientes.
            05 in-no-cte pic 9(10).
            05 in-nom-cte.
                10 in-1nom-cte pic X(20).
                10 in-2nom-cte pic X(20).
                10 in-apat-cte pic X(20).
                10 in-amat-cte pic X(20).
            05 in-rfc-cte pic X(13).
            05 in-eda-cte pic 9(3).
            05 in-fec-nac-cte.
                10 in-dia-nac-cte pic 9(2).
                10 filler pic X value '/'.
                10 in-mes-nac-cte pic 9(2).
                10 filler pic X value '/'.
                10 in-year-nac-cte pic 9(4).
            05 in-sex-cte pic X(1).
            05 in-dom-cte.
                10 in-cal-cte pic X(30).
                10 in-no-ext-cte pic 9(8).
                10 in-no-int-cte pic 9(8).
                10 in-mun-cte pic X(30).
                10 in-edo-cte pic X(30).
                10 in-pais-cte pic X(30).

        fd clientes-output-file.
        01 e1-clientes.
            05 e1-no-cte pic 9(10).
            05 e1-nom-cte.
                10 e1-1nom-cte pic X(20).
                10 e1-2nom-cte pic X(20).
                10 e1-apat-cte pic X(20).
                10 e1-amat-cte pic X(20).
            05 e1-rfc-cte pic X(13).
            05 e1-eda-cte pic 9(3).
            05 e1-fec-nac-cte.
                10 e1-dia-nac-cte pic 9(2).
                10 filler pic X value '/'.
                10 e1-mes-nac-cte pic 9(2).
                10 filler pic X value '/'.
                10 e1-year-nac-cte pic 9(4).
            05 e1-sex-cte pic X(1).
            05 e1-dom-cte.
                10 e1-cal-cte pic X(30).
                10 e1-no-ext-cte pic 9(8).
                10 e1-no-int-cte pic 9(8).
                10 e1-mun-cte pic X(30).
                10 e1-edo-cte pic X(30).
                10 e1-pais-cte pic X(30).

        sd clientes-work-file.
        01 wk-clientes.
            05 wk-no-cte pic 9(10).
            05 wk-nom-cte.
                10 wk-1nom-cte pic X(20).
                10 wk-2nom-cte pic X(20).
                10 wk-apat-cte pic X(20).
                10 wk-amat-cte pic X(20).
            05 wk-rfc-cte pic X(13).
            05 wk-eda-cte pic 9(3).
            05 wk-fec-nac-cte.
                10 wk-dia-nac-cte pic 9(2).
                10 filler pic X value '/'.
                10 wk-mes-nac-cte pic 9(2).
                10 filler pic X value '/'.
                10 wk-year-nac-cte pic 9(4).
            05 wk-sex-cte pic X(1).
            05 wk-dom-cte.
                10 wk-cal-cte pic X(30).
                10 wk-no-ext-cte pic 9(8).
                10 wk-no-int-cte pic 9(8).
                10 wk-mun-cte pic X(30).
                10 wk-edo-cte pic X(30).
                10 wk-pais-cte pic X(30).

        procedure division.
          sort clientes-work-file on ascending key e1-no-cte
          using clientes-input-file giving clientes-output-file.
          display "clientes ordenados".
        stop run.
