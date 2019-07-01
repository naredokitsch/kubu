//MATEKSD JOB MSGLEVEL=(1,1),NOTIFY=&SYSUID
//*
//* RUN A COBOL PROGRAM,
//*
//PASO1  EXEC PGM=SORT,COND=(0,LE)
//SYSOUT   DD SYSOUT=*
//SYSIN    DD   *
       SORT FIELDS=(1,10,CH,A)
//SORTIN   DD DSN=CLIENTE,DISP=SHR
//SORTOUT  DD DSN=CLIENTE2,
//         DISP=(NEW,CATLG,DELETE),VOL=SYSDTB1,
//         UNIT=4200,LABEL=3,SPACE=(TRK,(10,5),RLSE),
//         RECFM=FB,LRECL=10,BLKSIZE=1500
//SORTWK01 DD UNIT=SYSDA,SPACE=(CYL,(5,5),RLSE)
//*------------------------------------------------------------------
//PASO2  EXEC PGM=SORT,COND=(0,LE)
//SYSOUT   DD SYSOUT=*
//SYSIN    DD   *
       SORT FIELDS=(1,10,CH,A)
//SORTIN   DD DSN=CHEQUE,DISP=SHR
//SORTOUT  DD DSN=CHEQUE2,
//         DISP=(NEW,CATLG,DELETE),VOL=SYSDTB1,
//         UNIT=4200,LABEL=3,SPACE=(TRK,(10,5),RLSE),
//         RECFM=FB,LRECL=10,BLKSIZE=1500
//SORTWK01 DD UNIT=SYSDA,SPACE=(CYL,(5,5),RLSE)
//*------------------------------------------------------------------
//PASO3  EXEC PGM=PROGRAMA,COND=(0,LE)
//*STEPLIB DD
//*        DSN='C:\mfuser\proyects\EjemploEscritura\JCL\ejecuta.jcl',
//*        DISP=SHR
//SYSOUT DD SYSOUT=*
//CLIENTES DD DSN=CLIENTE2,DISP=SHR
//CHEQUES DD DSN=CHEQUE2,DISP=SHR
//REPORTE DD DSN=REPORTE,
//         DISP=(NEW,CATLG,DELETE),VOL=SYSDTB1,
//         UNIT=4200,LABEL=3,SPACE=(TRK,(10,5),RLSE),
//         RECFM=FB,LRECL=10,BLKSIZE=1500
//