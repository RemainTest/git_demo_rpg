     Fcusts     uf   e           k disk
     Fcusfl3    uf   e           k disk
     Fconhdrl1  uf a e           k disk
     Duwbccd           s                   like(xwbccd)
     Duwidx1           s              5s 0
      /Free
        //�Update CUSTS table
        xwbccd = 'ACC7';
        Chain(e) xwbccd custs;
        if %found(custs);
          person = 'MT1';
          update(e) custsr;
        endif;
        //�Update CUSF table
        cusno = 50;
        setll(e) cusno cusfl3;
        reade(e) cusno cusfl3;
        dow not %eof(cusfl3);
          usernm = 'User 1';
          update(e) rcusf;
          reade(e) cusno cusfl3;
        enddo;

        //�Update CONHDR Table
        xwbccd = 'ACC7';
        setll(e) xwbccd conhdrl1;
        reade(e) xwbccd conhdrl1;
        dow not %eof(conhdrl1);
          person = 'MT1';
          update(e) conhdrr;
          reade(e) xwbccd conhdrl1;
        enddo;

        //�Write new 'ACC10' records to CONHDR
        clear conhdrr;
        xwbccd = 'ACC10';
        for uwidx1 = 901 to 901;
          xwordn = uwidx1;
          xwdldt = %date();
          xwstat = 'A';
          person = 'NW1';
          write(e) conhdrr;
        endfor;

        *inlr = *on;
      /End-free
