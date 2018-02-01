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

        <!-- <div id="zone-user-wrapper" class="zone-wrapper zone-user-wrapper clearfix">
          <div id="zone-user" class="zone zone-user clearfix container_24">
            <div class="region-inner region-branding-inner">
              <div class="branding-data clearfix">
                
                <div class="logo-img">
                  <a href="${baseURL}" rel="home" title="GBIF Logo" class="active">
                    <img src="${baseURL}/images/GBIF-2015-standard-ipt.png" />
                  </a>
                </div>

                <hgroup class="site-name-slogan">
                  <h1 class="site-name"><a href="${baseURL}" rel="home" title="Home" class="active">Integrated Publishing Toolkit</a><span class="logoSuperscript">(IPT)</span></h1>
                  <h6 class="site-slogan">free and open access to biodiversity data</h6>
                  [#if !cfg.devMode() && cfg.getRegistryType()?has_content && cfg.getRegistryType()=='PRODUCTION']
                  [#else]
                    <img class="testmode" src="${baseURL}/styles/testmode.png" />
                  [/#if]
                </hgroup>

                <div id="region-user-second" class="region-inner region-user-second-inner">
                  <ul id="language-menu">
                    [#if (Session.curr_user)??]
                      <li>[@s.text name="menu.loggedin"][@s.param]${Session.curr_user.email}[/@s.param][/@s.text]</li>
                      <li[#if currentMenu=="account"] class="current"[/#if] ><a href="${baseURL}/account.do">[@s.text name="menu.account"/]</a></li>
                      <li[#if currentMenu=="logout"] class="current"[/#if]><a href="${baseURL}/logout.do">[@s.text name="menu.logout"/]</a></li>
                    [#else]
                      <li>
                        <form id="login-form" action="${baseURL}/login.do" method="post">
                          <input type="text" size="25" name="email" value="email" class="form-reset" />
                          <input type="password" size="20" name="password" value="password" class="form-reset" />
                          [@s.submit key="portal.login" name="login-submit"/]
                        </form>
                      </li>
                    [/#if]
                    <li>
                      <a href="#"><img src="${baseURL}/images/flags/flag_${localeLanguage}.png"/></a>
                      <ul id="languages"> -->
                        <!-- add more languages as translations become available. -->
                        <!-- To see more information go to langs method in global.js -->
                        <!--
                      </ul>
                    </li>
                  </ul>
                </div>

              </div>
            </div>
          </div>
        </div> -->

        <!-- show production logo only if ipt 1) .war was not built in test mode and 2) run in production mode -->
        <!--
        <div id="zone-branding-wrapper" class="zone-wrapper zone-branding-wrapper clearfix">
          <div id="zone-branding" class="zone zone-branding clearfix container_24">
            <div class="grid_13 region region-menu" id="region-menu">
              <nav>
                <ul>
                  <li[#if currentMenu=='home'] class="current"[/#if]><a href="${baseURL}/">[@s.text name="menu.home"/]</a></li>
                  [#if managerRights]
                    <li[#if currentMenu=='manage'] class="current"[/#if]><a href="${baseURL}/manage/">[@s.text name="menu.manage"/]</a></li>
                  [/#if]
                  [#if adminRights]
                    <li[#if currentMenu=='admin'] class="current"[/#if]><a href="${baseURL}/admin/">[@s.text name="menu.admin"/]</a></li>
                  [/#if]
                  <li[#if currentMenu=='about'] class="current"[/#if]><a href="${baseURL}/about.do">[@s.text name="menu.about"/]</a></li>
                </ul>
              </nav>
            </div>
          </div>
          <div id="search"></div>
        </div> -->

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
                <li class="current"><a href="#home">Home</a></li>
                <li class=""><a href="#about">About</a></li>
                <li class=""><a href="#faqs">FAQ</a></li>
                <li class=""><a href="#section-content">Datasets</a></li>
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

        [#if !(Session.curr_user)??]
        <!-- BEGIN TOP SECTION -->
        <div id="home" class="top-main">
          <div class="container">
            <div class="row">
              <div class="col-xs-12 col-md-7">
                <div class="top-main-info">
                  <div class="wow slideInLeft" >
                    <h2>APIs</h2>
                    <p>APIs is your infrastructure for data management helping researchers and scientists to organise, store, access, visualise, share and publish biodiversity data through the Global Biodiversity Information Facility (GBIF).</p>
                  </div>
                  [#if !(Session.curr_user)??]
                  <div class="wow fadeIn" data-wow-delay="2s">
                    <a href="${baseURL}/user.do"><button class="btn btn-lg btn-info">Register Now</button></a>
                  </div>
                  [/#if]
                </div>
              </div>
              <div class="hidden-xs hidden-sm col-md-4">
                <div class="top-main-img wow slideInRight">
                  <img src="${baseURL}/images/logo/logo_big.png" alt="APIS logo">
                </div>
              </div>
            </div>
          </div>
        </div>
        <!-- END TOP SECTION -->

      </header>

      <main id="main">

        <!-- BEGIN ABOUT SECTION -->
        <section id="about" class="section-padding">
          <div class="headline text-center">
            <h3>about</h3>
            <p>APIs is your infrastructure for data management helping researchers and scientists to organise, store, access, visualise, share and publish biodiversity data.</p>
            <p>APIs is using the broadly-used Darwin Core standard for biodiversity data.</p>
          </div>
          <div class="container">

            <div class="row">
              
              <div class="col-md-4 col-sm-6 wow fadeIn" data-wow-duration="2s">
                <div class="about">
                  <i class="fa fa-line-chart fa-5x"></i>
                  <h2>Biodiversity monitoring</h2>
                  <p>Share dynamic population abundance data including time series population data or presence/absence data, while documenting the sampling protocol</p>
                </div>
              </div>

              <div class="col-md-4 col-sm-6 wow fadeIn" data-wow-duration="2s" data-wow-delay="0.5s">
                <div class="about">
                  <i class="fa fa-plus-circle fa-5x"></i>
                  <h2>Benefits</h2>
                  <p>Bring your data into a larger context and make them available for scientists, analysts and policymakers</p>
                </div>
              </div>

              <div class="col-md-4 col-sm-6 wow fadeIn" data-wow-duration="2s" data-wow-delay="0.9s">
                <div class="about">
                  <i class="fa fa-creative-commons fa-5x"></i>
                  <h2>Open access</h2>
                  <p>APIs provides a solid framework for the integration, sharing and use of free and open biodiversity information</p>
                </div>
              </div>

            </div>
          </div>
        </section>
        <!-- END ABOUT SECTION -->

        <!-- BEGIN SECTION VIDEO -->
        <section class="video section-padding" style="background-image: url('${baseURL}/images/background/hexagon-shape.png');">
          <div class="video-overlay has-gradient"></div>
          <div class="container">
            <div class="headline text-center">
              <h3>Quick guide</h3>
              <p>APIs is using the Darwin Core Terms by TDWG.</p>
              <p>Learn the definitions to the essential information about the current recommended Darwin Core terms.</p>
            </div>
            <a href="http://rs.tdwg.org/dwc/terms/index.htm#theterms" class="video-action text-center" target="_blank">
              <i class="fa fa-hand-pointer-o"></i>
            </a>
          </div>
        </section>
        <!-- END SECTION VIDEO -->


        <!-- BEGIN FAQ SECTION -->
        <section id="faqs" class="faq section-padding">
          <div class="container">
            <div class="headline text-center">
              <h3>Frequently asked questions</h3>
              <p>Answers to the most frequently asked questions about APIs.</p>
            </div>
            <div class="row">

              <div class="col-md-6 wow fadeIn" data-wow-duration="2s">
                <div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true">
                  
                  <div class="panel">
                    <div class="panel-heading" role="tab" id="heading_1">
                      <h4 class="panel-title">
                        <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapse_1" aria-expanded="false" aria-controls="collapse_1">
                          What is APIs?
                        </a>
                      </h4>
                    </div>
                    <div id="collapse_1" class="panel-collapse collapse" role="tabpanel" aria-labelledby="heading_1" aria-expanded="false" style="height: 0px;">
                      <div class="panel-body">
                        APIs is a web application based on the Integrated Publishing Toolkit (IPT).
                        The IPT is a free open source software tool written in Java that is used to publish and share biodiversity datasets through the Global Biodiversity Information Facility (GBIF) network. The IPT is using the Darwin Core Archive (DwC-A).
                      </div>
                    </div>
                  </div>

                  <div class="panel">
                    <div class="panel-heading" role="tab" id="heading_2">
                      <h4 class="panel-title">
                        <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapse_2" aria-expanded="false" aria-controls="collapse_2">
                        What is meant by Darwin Core Archive?
                        </a>
                      </h4>
                    </div>
                    <div id="collapse_2" class="panel-collapse collapse" role="tabpanel" aria-labelledby="heading_2" aria-expanded="false" style="height: 0px;">
                      <div class="panel-body">
                        Darwin Core Archive (DwC-A) is a Biodiversity informatics data standard that makes use of the Darwin Core terms to produce a single, self contained dataset for species occurrence, event-based or taxonomic (species) data.<br><br>DwC-A is the preferred format for publishing data to GBIF. This archive contains a set of one or more text (CSV) files, a simple XML metadata descriptor file (called meta.xml) to inform others how your files are organized and a simple XML metadata file (called EML.xml) to describe your dataset.
                      </div>
                    </div>
                  </div>

                  <div class="panel">
                    <div class="panel-heading" role="tab" id="heading_3">
                      <h4 class="panel-title">
                        <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapse_3" aria-expanded="false" aria-controls="collapse_2">
                          What´s about Metadata?
                        </a>
                      </h4>
                    </div>
                    <div id="collapse_3" class="panel-collapse collapse" role="tabpanel" aria-labelledby="heading_3" aria-expanded="false" style="height: 0px;">
                      <div class="panel-body">
                        Metadata describes your datasat. This description is summarized in the EML.xml of the DwC-A. Every dataset requires a minimal set of descriptive metadata in order to be published on APIs. This basic metadata includes the title, type, description and contact for your dataset.
                      </div>
                    </div>
                  </div>

                  <div class="panel">
                    <div class="panel-heading" role="tab" id="heading_4">
                      <h4 class="panel-title">
                        <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapse_4" aria-expanded="false" aria-controls="collapse_2">
                          What is the difference between publishing on APIs and registering a dataset with GBIF?
                        </a>
                      </h4>
                    </div>
                    <div id="collapse_4" class="panel-collapse collapse" role="tabpanel" aria-labelledby="heading_4" aria-expanded="false" style="height: 0px;">
                      <div class="panel-body">
                        When you publish a dataset via APIs you create a DwC-A of your dataset which is accessible on APIs. But a dataset that has been registered with GBIF is discoverable through the GBIF website and the data from the dataset can be indexed by and accessed from the GBIF portal.
                      </div>
                    </div>
                  </div>
                  <div class="helpme"><p>Need more help?<br>Please contact the <a href="mailto:christian.langer@idiv.de">APIs Administrator.</a></p></div>
                </div>
              </div>

              <div class="col-md-6 wow fadeIn" data-wow-duration="2s" data-wow-delay="1s">
                <div class="faq-img">
                  <img src="images/logo/logo_big.png" alt="FAQ Image">
                </div>
              </div>
              
            </div>
          </div>
        </section>
        <!-- END FAQ SECTION -->
      </main>
      [/#if]


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
        <ul class="sidebar-nav" style="top:25px">
          <li class="title">[@s.text name='manage.metadata.section' /]</li>
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