      * ============================================================
      * © 2005-2009 COPYRIGHT UNICOM SYSTEMS, INC.
      *
      * ALL RIGHTS RESERVED
      *
      * THE INFORMATION CONTAINED HEREIN CONSTITUTES AN UNPUBLISHED
      * WORK OF UNICOM SYSTEMS, INC. ALL RIGHTS RESERVED.
      * NO MATERIAL FROM THIS WORK MAY BE REPRINTED,
      * COPIED, OR EXTRACTED WITHOUT WRITTEN PERMISSION OF
      * UNICOM SYSTEMS, INC.
      *=============================================================
     H COPYRIGHT('© 2005-2009 COPYRIGHT UNICOM SYSTEMS, INC.')
     H OPTION(*NODEBUGIO)
     H EXTBININT
     H TEXT('Descriptive text')
     H*ACTGRP(*CALLER)
     H*BNDDIR('M4LIB')
     H*NOMAIN


      * ===============================================================
      *
      * Program/Module: Name
      * Author:         Programmer
      * Date:           dd/mm/ccyy
      * Purpose:        Describe program or module function and special
      *                 considerations
      * Parameters:     param1 => Description & possible values
      *                 param2 => Description & possible values
      *                 paramn => Description & possible values
      *
      * ===============================================================
      *                          MAINTENANCE
      *
      * Programmer : A.N.other
      * Date       : today
      * Task Ref.  :
      * Amendment  :
      *
      * ===============================================================


      * Place file specifications here


      * Copybook includes
      /Copy IHADV100/QRPGLECPY,QYASPOL
      /Copy QRPGLECPY,ERRORCODE


      * Global data structures
     D QYASP0600       DS                  LIKEDS(YASP0600_t)
     D QYASP0100       DS                  QUALIFIED
     D  entries                            LIKEDS(YASP0100_t) DIM(3)
     D listInfo        DS                  LIKEDS(Qgy_YASP_List_Information_t)
     D errorCode       DS                  LIKEDS(errorCode_T)
     D filter          DS                  LIKEDS(yaspFilter_t)


      * Constants


      * Main processing

      /Free

         errorCode.bytesProvided = %size(errorCode_T);
         errorCode.bytesAvailable = 0;

         filter.entrySize = QYASPOL_DEVICE_FILTER_ENTRY_LENGTH;
         filter.key = QYASPOL_KEY_DEVICE;
         filter.dataSize = QYASPOL_DEVICE_FILTER_DATA_LENGTH;
         filter.device = 'IASP01    ';

         QYASPOL(QYASP0600
                :%size(QYASP0600)
                :listInfo
                :1
                :1
                :filter
                :QYASPOL_YASP0600
                :errorCode);

         filter.entrySize = QYASPOL_ASP_NUMBER_FILTER_ENTRY_LENGTH;
         filter.key = QYASPOL_KEY_NUMBER;
         filter.dataSize = QYASPOL_ASP_NUMBER_FILTER_DATA_LENGTH;
         filter.aspNumber = 33;

         QYASPOL(QYASP0600
                :%size(QYASP0600)
                :listInfo
                :1
                :1
                :filter
                :QYASPOL_YASP0600
                :errorCode);

         filter.entrySize = QYASPOL_ASP_NUMBER_FILTER_ENTRY_LENGTH;
         filter.key = QYASPOL_KEY_NUMBER;
         filter.dataSize = QYASPOL_ASP_NUMBER_FILTER_DATA_LENGTH;
         filter.aspNumber = QYASPOL_NUMBERKEY_ALL;

         QYASPOL(QYASP0100
                :%size(QYASP0100)
                :listInfo
                :3
                :1
                :filter
                :QYASPOL_YASP0100
                :errorCode);

         *INLR = *ON;

         return;

      /End-free
