<!--
  -- MHonArc Resource File for mail and news archives.
  --                                 v 1.0  2013-02-03
-->

<!-- 外部変数：対象名 -->
<DefineVar chop>
TARGET
</DefineVar>

<!-- 文字コードの設定（文字化け回避用）-->
<Include>
utf-8-encode.mrc
</Include>

<DefCharset>
iso-2022-jp
</DefCharset>

<DecodeHeads>

<!-- charsetのデフォルトをiso-2022-jpとする -->
<MIMEARGS>
text/plain:default=iso-2022-jp
</MIMEARGS>

<!-- MIME encodeされたSubjectをdecodeする -->
<DECODEHEADS>

<!-- MIME encodeされていないSubject(iso-2022-jpベタなSubject)をiso-2022-jpとして扱う -->
<CHARSETCONVERTERS>
plain;          iso_2022_jp::str2html;     iso2022jp.pl
</CHARSETCONVERTERS>

<!-- X-XXXX 形式のヘッダー出力機能をOFFにする -->
<NoPrintXComments>

<!-- コピーライトを表示しない -->
<Nodoc>

<!--
  -- メールアドレスのドメイン名を XXX に置換する
  -- 例) send@example.com → sendmail@xxxxxxxxxxx
  -- <SpamMode>
-->

<!-- mailto タグを生成しない(from をそのまま表示) -->
<NoMailTo>

<!-- HTMLの作成時間をメールの投稿時間にする -->
<Modtime>

<!-- 各メッセージファイル -->
<!-- HTMLの作成時間をメールの投稿時間にする -->
<Modtime>

<!-- 変換フィルター -->
<MIMEFilters>
application/octet-stream;  m2h_external::filter;	mhexternal.pl
application/*;		   m2h_external::filter;	mhexternal.pl
application/x-patch;	   m2h_text_plain::filter;	mhtxtplain.pl
audio/*;		   m2h_external::filter;	mhexternal.pl
chemical/*;		   m2h_external::filter;	mhexternal.pl
model/*;		   m2h_external::filter;	mhexternal.pl
image/*;		   m2h_external::filter;	mhexternal.pl
message/delivery-status;   m2h_text_plain::filter;	mhtxtplain.pl
message/external-body;     m2h_msg_extbody::filter;	mhmsgextbody.pl
message/partial;	   m2h_text_plain::filter;	mhtxtplain.pl
text/*;			   m2h_text_plain::filter;	mhtxtplain.pl
text/enriched;		   m2h_text_enriched::filter;	mhtxtenrich.pl
text/html;		   m2h_text_html::filter;	mhtxthtml.pl
text/plain;		   m2h_text_plain::filter;	mhtxtplain.pl
text/richtext;		   m2h_text_enriched::filter;	mhtxtenrich.pl
text/tab-separated-values; m2h_text_tsv::filter;	mhtxttsv.pl
text/x-html;		   m2h_text_html::filter;	mhtxthtml.pl
video/*;		   m2h_external::filter;	mhexternal.pl
x-sun-attachment;	   m2h_text_plain::filter;	mhtxtplain.pl
</MIMEFilters>

<!-- ================================================================== -->
<!--                           メッセージ                               -->
<!-- ================================================================== -->

<!-- メッセージのHTMLヘッダ -->
<MsgPgBegin>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <title>$SUBJECTNA:72$</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">

    <!-- Le styles -->
    <link href="../../assets/css/bootstrap.css" rel="stylesheet">
    <style type="text/css">
      body {
        padding-top: 60px;
        padding-bottom: 40px;
      }
    </style>
    <link href="../../assets/css/bootstrap-responsive.css" rel="stylesheet">

    <script src="../../assets/js/jquery.min.js"></script>

    <!-- HTML5 shim, for IE6-8 support of HTML5 elements -->
    <!--[if lt IE 9]>
      <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
    <![endif]-->

    <!-- Fav and touch icons -->
    <link rel="apple-touch-icon-precomposed" sizes="144x144" href="../../assets/ico/apple-touch-icon-144-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="114x114" href="../../assets/ico/apple-touch-icon-114-precomposed.png">
      <link rel="apple-touch-icon-precomposed" sizes="72x72" href="../../assets/ico/apple-touch-icon-72-precomposed.png">
                    <link rel="apple-touch-icon-precomposed" href="../../assets/ico/apple-touch-icon-57-precomposed.png">
                                   <link rel="shortcut icon" href="../../assets/ico/favicon.png">

    <script type="text/javascript">
    <!--
      function getUrlVars()
      {
          var vars = [], hash;
          var hashes = window.location.href.slice(window.location.href.indexOf('?') + 1).split('&');
          for(var i = 0; i < hashes.length; i++)
          {
              hash = hashes[i].split('=');
              vars.push(hash[0]);
              vars[hash[0]] = hash[1];
          }
          return vars;
      }

      $$(function() {
        $$('#index_tab a:last').tab('show');
      });
    //-->
    </script>
  </head>

  <body data-spy="scroll" data-target=".bs-docs-sidebar" lang="ja">

    <div class="navbar navbar-inverse navbar-fixed-top">
      <div class="navbar-inner">
        <div class="container">
          <a class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse">
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </a>
          <a class="span3 brand active" href="#">$TARGET$</a>
          <div class="nav-collapse collapse">
            <ul class="nav">
              <li class="active"><a href="$IDXFNAME$#$MSGNUM$" rel="tooltip" title="インデックス(日付順)"><i class="icon-list"></i></a></li>
              <li class="active"><a href="$TIDXFNAME$#$MSGNUM$" rel="tooltip" title="インデックス(スレッド順)"><i class="icon-align-right"></i></a></li>
            </ul>
            <form class="navbar-form pull-right" name="indexActionForm" method="get" action="http://192.168.0.1:8080/fess/search">
              <div class="input">
                <input class="span3" type="text" name="query" maxlength="1000" size="50" value="" id="contentQuery">
                <button class="btn" type="submit" name="search" id="contentSearchButton">検索</button>
              </div>
            </form>
            <ul class="nav">
              <li class="active"><a href="$MSG(TPREVTOP)$" rel="tooltip" title="前のスレッド"><i class="icon-backward"></i></a></li>
              <li class="active"><a href="$MSG(TPREV)$" rel="tooltip" title="前のメッセージ"><i class="icon-chevron-left"></i></a></li>
              <li class="active"><a href="$MSG(TNEXT)$" rel="tooltip" title="次のメッセージ"><i class="icon-chevron-right"></i></a></li>
              <li class="active"><a href="$MSG(TNEXTTOP)$" rel="tooltip" title="次のスレッド"><i class="icon-forward"></i></a></li>
            </ul>
          </div><!--/.nav-collapse -->
        </div>
      </div>
    </div>

    <div class="container">
</MsgPgBegin>

<!-- トップページへのリンク -->
<TopLinks>
$TSLICE$
</TopLinks>

<SubjectHeader>
<div class="alert alert-info"><h4>$SUBJECTNA$</h4></div>
<hr>
</SubjectHeader>

<!-- 表示するメールヘッダの指定 -->
<FieldOrder>
to
from
date
</FieldOrder>

<!-- 無視するメールヘッダの指定 -->
<Excs>
To
Subject
List-
Reply-to
In-reply-to
References
Domainkey-signature
Dkim-signature
</Excs>

<MsgBodyEnd>
$TSLICE$
</MsgBodyEnd>

<TSlice>
10:10:1
</TSlice>

<TSliceBeg>
<div class="pagination pagination-centered">
  <ul>
    <li><a href="$MSG(TPREV)$">Prev</a></li>
</TSliceBeg>

<TSliceTopBeg>
    <li><a $A_ATTR$>$MSGTORDNUM$</a></li>
</TSliceTopBeg>

<TSliceLiTxt>
    <li><a $A_ATTR$>$MSGTORDNUM$</a></li>
</TSliceLiTxt>

<TSliceSingleTxt>
    <li><a $A_ATTR$>$MSGTORDNUM$</a></li>
</TSliceSingleTxt>

<TSliceTopBegCur>
    <li class="active"><a $A_ATTR$>$MSGTORDNUM$</a></li>
</TSliceTopBegCur>

<TSliceLiTxtCur>
    <li class="active"><a $A_ATTR$>$MSGTORDNUM$</a></li>
</TSliceLiTxtCur>

<TSliceSingleTxtCur>
    <li class="active"><a $A_ATTR$>$MSGTORDNUM$</a></li>
</TSliceSingleTxtCur>

<TSliceEnd>
    <li><a href="$MSG(TNEXT)$">Next</a></li>
  </ul>
</div>
</TSliceEnd>

<TSliceIndentBeg>
<!-- TSliceIndentBeg -->
</TSliceIndentBeg>

<TSliceIndentEnd>
<!-- TSliceIndentEnd -->
</TSliceIndentEnd>

<TSliceSubjectBeg>
<!-- TSliceSubjectBeg -->
</TSliceSubjectBeg>

<TSliceSubListBeg>
<!-- TSliceSubListBeg -->
</TSliceSubListBeg>

<TSliceSubListEnd>
<!-- TSliceSubListEnd -->
</TSliceSubListEnd>

<!-- フォローアップリンク -->
<FolUpBegin>
<!-- FolUpBegin -->
</FolUpBegin>

<FolupLiTxt>
<!-- FolupLiTxt -->
</FolupLiTxt>

<FolupEnd>
<!-- FolupEnd -->
</FolupEnd>

<!-- リファレンスリンク -->
<RefsBegin>
<!-- RefsBegin -->
</RefsBegin>
 
<RefsLiTxt>
<!-- RefsLiTxt -->
</RefsLiTxt>

<RefsEnd>
<!-- RefsEnd -->
</RefsEnd>

<BotLinks>
<!-- BotLinks -->
</BotLinks>

<!-- メッセージのHTMLフッダ -->
<MsgPgEnd>
    </div><!--/.container-narrow-->

    <!-- Le javascript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="../../assets/js/bootstrap.min.js"></script>

  </body>
</html>
</MsgPgEnd>


<!-- 複数ページのインデックスを作成(1ページ20件) -->
<MultiPG>
<IdxSize>
50
</IdxSize>

<!-- ================================================================== -->
<!--                       メインインデックス                           -->
<!-- ================================================================== -->

<!-- メインインデックス(日付順)を作成する -->
<Main>

<!-- メインインデックスのファイル名 -->
<IdxFName>
date.html
</IdxFName>

<!-- トップページ名 -->
<Title>
トップページ(日付順)
</Title>

<!-- 新着順 -->
<Sort>
<Reverse>

<!-- メインインデックスのHTMLヘッダ -->
<IdxPgBegin>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <title>$TARGET$(日付順)</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">

    <!-- Le styles -->
    <link href="../../assets/css/bootstrap.css" rel="stylesheet">
    <style type="text/css">
      body {
        padding-top: 60px;
        padding-bottom: 40px;
      }
      table.index_date caption {
        text-align: left;
      }
    </style>
    <link href="../../assets/css/bootstrap-responsive.css" rel="stylesheet">

    <script src="../../assets/js/jquery.min.js"></script>

    <!-- HTML5 shim, for IE6-8 support of HTML5 elements -->
    <!--[if lt IE 9]>
      <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
    <![endif]-->

    <!-- Fav and touch icons -->
    <link rel="apple-touch-icon-precomposed" sizes="144x144" href="../../assets/ico/apple-touch-icon-144-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="114x114" href="../../assets/ico/apple-touch-icon-114-precomposed.png">
      <link rel="apple-touch-icon-precomposed" sizes="72x72" href="../../assets/ico/apple-touch-icon-72-precomposed.png">
                    <link rel="apple-touch-icon-precomposed" href="../../assets/ico/apple-touch-icon-57-precomposed.png">
                                   <link rel="shortcut icon" href="../../assets/ico/favicon.png">

    <script type="text/javascript">
    <!--
      function getUrlVars()
      {
          var vars = [], hash;
          var hashes = window.location.href.slice(window.location.href.indexOf('?') + 1).split('&');
          for(var i = 0; i < hashes.length; i++)
          {
              hash = hashes[i].split('=');
              vars.push(hash[0]);
              vars[hash[0]] = hash[1];
          }
          return vars;
      }

      $$(function() {
        $$('#index_tab a:last').tab('show');
      });
    //-->
    </script>
  </head>

  <body data-spy="scroll" data-target=".bs-docs-sidebar" lang="ja">

    <div class="navbar navbar-inverse navbar-fixed-top">
      <div class="navbar-inner">
        <div class="container">
          <a class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse">
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </a>
          <a class="span3 brand active" href="#">$TARGET$(日付順)</a>
          <div class="nav-collapse collapse">
            <ul class="nav">
              <li class="active"><a href="$IDXFNAME$#$MSGNUM$" rel="tooltip" title="インデックス(日付順)"><i class="icon-list"></i></a></li>
              <li class="active"><a href="$TIDXFNAME$#$MSGNUM$" rel="tooltip" title="インデックス(スレッド順)"><i class="icon-align-right"></i></a></li>
            </ul>
            <form class="navbar-form pull-right" name="indexActionForm" method="get" action="http://10.58.10.61:8080/fess/search">
              <div class="input">
                <input class="span3" type="text" name="query" maxlength="1000" size="50" value="" id="contentQuery">
                <button class="btn" type="submit" name="search" id="contentSearchButton">検索</button>
              </div>
            </form>
            <ul class="nav">
              <li class="active"><a href="$PG(FIRST)$" rel="tooltip" title="先頭のインデックス"><i class="icon-fast-backward"></i></a></li>
              <li class="active"><a href="$PG(PREV)$" rel="tooltip" title="前のインデックス"><i class="icon-chevron-left"></i></a></li>
              <li class="active"><a href="$PG(NEXT)$" rel="tooltip" title="次のインデックス"><i class="icon-chevron-right"></i></a></li>
              <li class="active"><a href="$PG(LAST)$" rel="tooltip" title="最後のインデックス"><i class="icon-fast-forward"></i></a></li>
            </ul>
          </div><!--/.nav-collapse -->
        </div>
      </div>
    </div>
</IdxPgBegin>

<MsgLocalDateFmt>
%Y/%m/%d(%a)
</MsgLocalDateFmt>

<!-- リストの頭の書式 -->
<ListBegin>
    <div class="container">
    <div class="row">
    <div class="span12">
</ListBegin>

<!-- 日付毎の書式 -->
<DayBegin>
      <table class="table table-hover table-condensed index_date">
        <caption>
        <font color="#708898"><strong>$MSGLOCALDATE$</strong></font>
        </caption>
</DayBegin>

<DayEnd>
      </table>
</DayEnd>

<!-- 各記事のリスト書式 -->
<LiTemplate>
          <tr>
            <td><a $A_ATTR$><i class="icon-ok"></i>$SUBJECTNA$</a>&nbsp;<i>$FROM$</i></td>
          </tr>
</LiTemplate>

<!-- リストのおわりの書式 -->
<ListEnd>
<!-- ListEnd -->
</ListEnd>

<!-- メインインデックスのHTMLフッダ -->
<IdxPgEnd>
    </div><!--/.container-narrow-->

    <!-- Le javascript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="../../assets/js/bootstrap.min.js"></script>

  </body>
</html>
</IdxPgEnd>


<!-- ================================================================== -->
<!--                      スレッドインデックス                          -->
<!-- ================================================================== -->

<!-- スレッドインデックスを作成する -->
<Thread>

<TIdxFName>
thread.html
</TIdxFName>

<!-- トップページ名 -->
<TTitle>
メッセージ一覧(スレッド順)
</TTitle>

<!-- 新着順 -->
<TSort>
<TReverse>

<!-- スレッドの深さ -->
<TLevels>
10
</TLevels>

<!-- スレッドインデックスのHTMLヘッダ -->
<TIdxPgBegin>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <title>$TARGET$(スレッド順)</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">

    <!-- Le styles -->
    <link href="../../assets/css/bootstrap.css" rel="stylesheet">
    <style type="text/css">
      body {
        padding-top: 60px;
        padding-bottom: 40px;
      }
      .index-padding0 {
        padding-left: 1em;
        text-indent: -1em;
      }
      .index-padding1 {
        padding-left: 2em;
        text-indent: -1em;
      }
      .index-padding2 {
        padding-left: 3em;
        text-indent: -1em;
      }
      .index-padding3 {
        padding-left: 4em;
        text-indent: -1em;
      }
      .index-padding4 {
        padding-left: 5em;
        text-indent: -1em;
      }
      .index-padding5 {
        padding-left: 6em;
        text-indent: -1em;
      }
      .index-padding6 {
        padding-left: 7em;
        text-indent: -1em;
      }
      .index-padding7 {
        padding-left: 8em;
        text-indent: -1em;
      }
      .index-padding8 {
        padding-left: 9em;
        text-indent: -1em;
      }
      .index-padding9 {
        padding-left: 10em;
        text-indent: -1em;
      }
      .index-padding10 {
        padding-left: 11em;
        text-indent: -1em;
      }
    </style>
    <link href="../../assets/css/bootstrap-responsive.css" rel="stylesheet">

    <script src="../../assets/js/jquery.min.js"></script>

    <!-- HTML5 shim, for IE6-8 support of HTML5 elements -->
    <!--[if lt IE 9]>
      <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
    <![endif]-->

    <!-- Fav and touch icons -->
    <link rel="apple-touch-icon-precomposed" sizes="144x144" href="../../assets/ico/apple-touch-icon-144-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="114x114" href="../../assets/ico/apple-touch-icon-114-precomposed.png">
      <link rel="apple-touch-icon-precomposed" sizes="72x72" href="../../assets/ico/apple-touch-icon-72-precomposed.png">
                    <link rel="apple-touch-icon-precomposed" href="../../assets/ico/apple-touch-icon-57-precomposed.png">
                                   <link rel="shortcut icon" href="../../assets/ico/favicon.png">

    <script type="text/javascript">
    <!--
      function getUrlVars()
      {
          var vars = [], hash;
          var hashes = window.location.href.slice(window.location.href.indexOf('?') + 1).split('&');
          for(var i = 0; i < hashes.length; i++)
          {
              hash = hashes[i].split('=');
              vars.push(hash[0]);
              vars[hash[0]] = hash[1];
          }
          return vars;
      }

      $$(function() {
        $$('#index_tab a:last').tab('show');
      });
    //-->
    </script>
  </head>

  <body data-spy="scroll" data-target=".bs-docs-sidebar" lang="ja">

    <div class="navbar navbar-inverse navbar-fixed-top">
      <div class="navbar-inner">
        <div class="container">
          <a class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse">
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </a>
          <a class="span3 brand active" href="#">$TARGET$(スレッド順)</a>
          <div class="nav-collapse collapse">
            <ul class="nav">
              <li class="active"><a href="$IDXFNAME$" rel="tooltip" title="インデックス(日付順)"><i class="icon-list"></i></a></li>
              <li class="active"><a href="$TIDXFNAME$" rel="tooltip" title="インデックス(スレッド順)"><i class="icon-align-right"></i></a></li>
            </ul>
            <form class="navbar-form pull-right" name="indexActionForm" method="get" action="http://10.58.10.61:8080/fess/search">
              <div class="input">
                <input class="span3" type="text" name="query" maxlength="1000" size="50" value="" id="contentQuery">
                <button class="btn" type="submit" name="search" id="contentSearchButton">検索</button>
              </div>
            </form>
            <ul class="nav">
              <li class="active"><a href="$PG(TFIRST)$" rel="tooltip" title="先頭のインデックス"><i class="icon-fast-backward"></i></a></li>
              <li class="active"><a href="$PG(TPREV)$" rel="tooltip" title="前のインデックス"><i class="icon-chevron-left"></i></a></li>
              <li class="active"><a href="$PG(TNEXT)$" rel="tooltip" title="次のインデックス"><i class="icon-chevron-right"></i></a></li>
              <li class="active"><a href="$PG(TLAST)$" rel="tooltip" title="最後のインデックス"><i class="icon-fast-forward"></i></a></li>
            </ul>
          </div><!--/.nav-collapse -->
        </div>
      </div>
    </div>

    <div class="container">
    <div class="row">
    <div class="span12">
</TIdxPgBegin>

<!-- リストの頭の指定 -->
<THead>
      <table class="table table-hover table-condensed">
        <tbody>
</THead>

<!-- スレッド先頭の書式 -->
<TTopBegin>
          <tr class="warning">
            <td><div class="index-padding0"><a $A_ATTR$><i class="icon-ok"></i>$SUBJECTNA$</a>&nbsp;<i>$FROM$</i></div></td>
          </tr>
</TTopBegin>

<TSubListBeg>
<!-- TSubListBeg -->
</TSubListBeg>

<TSubjectBeg>
<!-- TSubjectBeg -->
</TSubjectBeg>

<!-- 各メッセージのリスト書式 -->
<TLiTxt>
          <tr>
            <td><div class="index-padding$TLEVEL$"><a $A_ATTR$><i class="icon-chevron-right"></i>$SUBJECTNA$</a>&nbsp;<i>$FROM$</i></div></td>
          </tr>
</TLiTxt>

<TLiEnd>
<!-- TLiEnd -->
</TLiEnd>

<TSubListEnd>
<!-- TSubListEnd -->
</TSubListEnd>

<!-- スレッドの無い記事の扱い -->
<TSingleTxt>
          <tr class="warning">
            <td><div class="index-padding0"><a $A_ATTR$><i class="icon-ok"></i>$SUBJECTNA$</a>&nbsp;<i>$FROM$</i></div></td>
          </tr>
</TSingleTxt>

<!-- Subject毎のおわり -->
<TTopEnd>
<!-- TTopEnd -->
</TTopEnd>

<!-- リスト書式のおわり -->
<TFoot>
        </tbody>
      </table>
</TFoot>

<!-- スレッドインデックスのHTMLフッダ -->
<TIdxPgEnd>
    </div><!--/.span12 -->
    </div><!--/.row -->
    </div><!--/.container -->

    <!-- Le javascript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="../../assets/js/bootstrap.min.js"></script>

  </body>
</html>
</TIdxPgEnd>
