<#ftl output_format="HTML">
</div>
			</div>
			</section>
<!-- 			<footer id="section-footer" class="section section-footer">
  			<div id="zone-footer-wrapper" class="zone-wrapper zone-footer-wrapper clearfix">  
      		<div id="zone-footer" class="zone zone-footer clearfix container_24">
      			<ul>
			        <li>IPT <@s.text name="footer.version"/> ${cfg.version!"???"}</li>
			        <li><a href="http://www.gbif.org/ipt"><@s.text name="footer.projectHome"/></a></li>
			        <li><a href="https://github.com/gbif/ipt/wiki/IPT2ManualNotes.wiki" target="_blank"><@s.text name="footer.useManual"/></a></li>
			        <li><a href="https://github.com/gbif/ipt/issues/new" target="_blank"><@s.text name="footer.bugReport"/></a></li>
			        <li><a href="https://github.com/gbif/ipt/issues/new" target="_blank"><@s.text name="footer.featureRequest"/></a></li>
		        </ul>
      		</div>
  			</div>

  			<div id="zone-credit-wrapper" class="zone-wrapper zone-footer-wrapper clearfix">
          <div id="zone-credit" class="zone zone-credit clearfix container_24">
            <aside class="grid_16 region region-credit-first" id="region-credit-first">
              <div class="region-inner region-credit-first-inner">
                <p>&copy;2017 <a href="http://www.gbif.org">Global Biodiversity Information Facility</a>.</p>
              </div>
            </aside>
          </div>
  			</div>
			</footer>	 -->
      <!-- ********************************** -->
      <!-- CUSTOMIZATION STARTS HERE -->
      <!-- ********************************** -->

        <!-- BEGIN PARTNER SECTION -->
        <div id="partner" class="partner">
         <div class="container">
          <div class="row text-center">
            <div class="col-lg-4 col-md-4 col-xs-6">
              <a href="http://www.idiv.de" target="_blank">
                <img src="${baseURL}/images/logo/partner/idiv.jpg" alt="iDiv">
              </a>
            </div>
            <div class="col-lg-4 col-md-4 col-xs-6">
              <a href="http://www.geobon.org" target="_blank">
                <img src="${baseURL}/images/logo/partner/geobon.jpg" alt="GEO BON">
              </a>
            </div>
            <div class="col-lg-4 col-md-4 col-xs-6">
              <a href="http://www.gbif.org" target="_blank">
                <img src="${baseURL}/images/logo/partner/gbif.jpg" alt="GBIF">
              </a>
            </div>
          </div>
         </div>
        </div>
      <!-- END PARTNER SECTION -->
      <!-- BEGIN FOOTER -->
      <footer>
      <div class="container text-center footer-top">
        <p>Copyright &copy; 2017<script>new Date().getFullYear()>2017&&document.write(" - "+new Date().getFullYear());</script> <a href="http://www.idiv.de" target="_blank">iDiv</a> · German Centre for Integrative Biodiversity Research (iDiv) Halle - Jena - Leipzig · iDiv is a research centre of the DFG</p> 
          <div class="credits" data-toggle="modal" data-target="#iptCredits">
            <p>APIs is using the IPT - Learn more here</p> 
          </div>
      </div> 
      <!-- Modal -->
      <div class="modal fade" id="iptCredits" role="dialog">
        <div class="modal-dialog">
        
          <!-- Modal content-->
          <div class="modal-content">
            <div class="modal-header">
              <h4 class="modal-title">Information</h4>
            </div>
            <div class="modal-body">
              <p>APIs is using the Integrated Publishing Toolkit (IPT) by GBIF.</p>
              <br>
              <table class="table table-striped">
                <tbody>
                  <tr>
                    <td>Version</td>
                    <td><@s.text name="footer.version"/> ${cfg.version!"???"}</td>
                  </tr>
                  <tr>
                    <td><@s.text name="footer.projectHome"/></td>
                    <td><a href="http://www.gbif.org/ipt" target="_blank">GBIF.org</a></td>
                  </tr>
                  <tr>
                    <td><@s.text name="footer.useManual"/></td>
                    <td><a href="https://github.com/gbif/ipt/wiki/IPT2ManualNotes.wiki" target="_blank">github.com/gbif/ipt/wiki</a></td>
                  </tr>
                  <tr>
                    <td><@s.text name="footer.bugReport"/></td>
                    <td><a href="https://github.com/gbif/ipt/issues/new" target="_blank">github.com/gbif/ipt/issues</a></td>
                  </tr>
                  <tr>
                    <td><@s.text name="footer.featureRequest"/></td>
                    <td><a href="https://github.com/gbif/ipt/issues/new" target="_blank">github.com/ipt/ipt/issues</a></td>
                  </tr>
                </tbody>
              </table>
              <br>
              <p>Design and Customization by <a href="http://www.geobon.org" target="_blank">GEO BON</a>.</p>
              <p>Contact <a href="mailto:christian.langer[at]idiv.de">IPT administrator</a> for further informations.</p>
            </div>
            <div class="modal-footer">
              <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
            </div>
          </div>
        </div>
      </div>
      </footer>
      <!-- END FOOTER -->

		</div>

    <div id="modalbox"><div id="modalback"></div><div id="modalcontainer"><div id="modalcontent"></div></div></div>
    <!-- Core JavaScript -->
    <script type="text/javascript" src="${baseURL}/vendor/bootstrap/js/bootstrap.min.js"></script>
    <!-- Plugin JavaScript -->
    <script type="text/javascript" src="${baseURL}/vendor/jquery-easing/jquery.easing.min.js"></script>
    <script type="text/javascript" src="${baseURL}/vendor/jquery-nav/jquery.nav.js"></script>
    <script type="text/javascript" src="${baseURL}/js/wow.js"></script>
    <!-- Custom JavaScript -->
    <script type="text/javascript" src="${baseURL}/js/custom.js"></script>
	</body>
</html>
