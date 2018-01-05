[#ftl output_format="HTML"]

<script type="text/javascript">
	$(document).ready(function(){
  		langs("${localeLanguage}","${baseURL}");
	});
</script>

<script type="text/javascript" src="${baseURL}/js/jconfirmation.jquery.js"></script>
<script type="text/javascript">
$(document).ready(function(){
  initHelp();
  $('.confirm').jConfirmAction({question : "<@s.text name="basic.confirm"/>", yesAnswer : "<@s.text name="basic.yes"/>", cancelAnswer : "<@s.text name="basic.no"/>"});
});   
</script> 

</head>
 	<body>
		    <div class="page clearfix" id="page">
      
      

      <!-- <header id="section-header" class="section section-header"> -->
        <header id="header-main" class="home-main-video">

        [#if !(Session.curr_user)??]

        <!-- ********************************** -->
        <!-- CUSTOMIZATION STARTS HERE -->
        <!-- ********************************** -->

        <div class="header-main-video">
          <video autoplay loop muted>
            <source src="${baseURL}/video/687902076.mp4" type="video/mp4">
          </video>
        </div>
        <div class="header-main-overlay has-gradient"></div>
        [/#if]

        <!-- BEGIN NAVBAR -->
        <nav class="navbar navbar-default navbar-fixed-top nav-fixed-bg">
          <div class="container">
            <div class="navbar-header">
              <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
              </button>
              <a class="navbar-brand" href="${baseURL}/">
                <img src="${baseURL}/images/logo/logo.png" alt="APIS Logo">
              </a>
            </div>
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
              <ul class="nav navbar-nav navbar-right" id="nav-main">
                [#if (Session.curr_user)??]
                <li[#if currentMenu=='home'] class="current"[/#if]><a href="${baseURL}/">[@s.text name="menu.home"/]</a></li>
                [#else]
                <li class=""><a href="${baseURL}">Home</a></li>
                <li class="current"><a href="#section-content">${eml.title!resource.shortname}</a></li>
                [/#if]
                [#if managerRights]
                <li[#if currentMenu=='manage'] class="current"[/#if]><a href="${baseURL}/manage/">[@s.text name="menu.manage"/]</a></li>
                [/#if]
                [#if adminRights]
                <li[#if currentMenu=='admin'] class="current"[/#if]><a href="${baseURL}/admin/">[@s.text name="menu.admin"/]</a></li>
                [/#if]
                [#if (Session.curr_user)??]
                <li class="dropdown">
                  <a href="#" class="dropdown-toggle" data-toggle="dropdown"><span class="fa fa-user-circle-o"></span> [@s.text name="menu.loggedin"][@s.param]${Session.curr_user.firstname} ${Session.curr_user.lastname}[/@s.param][/@s.text] <span class="caret"></span></a>       
                  <ul class="dropdown-menu" role="menu">
                    <li[#if currentMenu=="account"] class="current"[/#if]><a href="${baseURL}/account.do"><span class="fa fa-user"></span> [@s.text name="menu.account"/]</a></li>
                    <li class="divider"></li>
                    <li[#if currentMenu=="logout"] class="current"[/#if]><a href="${baseURL}/logout.do"><span class="fa fa-sign-out"></span> [@s.text name="menu.logout"/]</a></li>
                  </ul>
                </li>
              [#else]
                <li>
                  <form id="login-form" role="form" action="${baseURL}/login.do" method="post" name="loginform" class="navbar-form navbar-right">
                    <div class="form-group">
                      <input type="text" name="email" placeholder="Your Email" required class="form-control" />
                    </div>
                    <div class="form-group">
                      <input type="password" name="password" placeholder="Your Password" required class="form-control" />
                    </div>
                    [@s.submit key="portal.login" type="submit" value="Login" class="btn btn-info" name="login-submit"/]
                  </form>
                </li>
                [/#if]
              </ul>
            </div>
          </div>
        </nav>
        <!-- END NAVBAR -->

      </header>


      <!-- <section id="section-content" class="section section-content"> -->
      <section id="section-content" class="section section-padding section-content">
        <div id="zone-content-wrapper" class="zone-wrapper zone-content-wrapper clearfix">
          <!-- <div id="zone-content" class="zone zone-content clearfix container_24"> -->
          <div id="zone-content" class="zone zone-content clearfix container">


[#if sideMenuEml!false]

      <!-- <aside class="grid_6 push_18"> -->
      <aside class="col-md-3 pull-right">
      <!-- <div class="clearfix" id="sidebar"> -->
      <div class="clearfix">
        <h2 style="color:#514A9D">[@s.text name='manage.metadata.section' /]</h2>
        <ul class="sidebar">
        [#list ["basic", "geocoverage", "taxcoverage","tempcoverage", "keywords", "parties", "project", "methods", "citations", "collections", "physical", "additional"] as it]
         <li[#if currentSideMenu?? && currentSideMenu==it] class="current"[#else] class="sidebar"[/#if]><a href="metadata-${it}.do?r=${resource.shortname!r!}">[@s.text name="submenu.${it}"/]</a></li>
        [/#list]
        </ul>
      </div>
      </aside>

     <!--  <div class="grid_18 pull_6 region region-content" id="region-content"> -->
      <div class="col-md-9" id="region-content">

[#else]

      <!-- <div class="grid_24 region region-content" id="region-content"> -->
      <div class="region region-content" id="region-content">
[/#if]


      [@s.actionmessage/]
      [#if warnings?size>0]
       <ul class="warnMessage">
       [#list warnings as w]
            <li><span>${w!}</span></li>
       [/#list]
             </ul>
            [/#if]
      [@s.actionerror/]

            <div id="dialog-confirm" title="[@s.text name="basic.confirm"/]" style="display: none;"></div>