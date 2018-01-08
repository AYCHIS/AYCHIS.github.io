## Welcome to APIs! 

APIs is your infrastructure for data management helping researchers and scientists to organise, store, access, visualise, share and publish biodiversity data through the Global Biodiversity Information Facility (GBIF) easily.<br>APIs is based on the IPT Version 2.3.4 but comes with a new design and improved functionalities.

APIs landing page: 

![APIs landing page](http://home.uni-leipzig.de/idiv/ipt/screenshots/screen6.png)

### About the GBIF IPT

The IPT is a free open source software tool written in Java that is used to publish and share biodiversity datasets through the GBIF network. The IPT can also be configured with either a DataCite or EZID account in order to assign DOIs to datasets transforming it into a data repository. 

To understand how the IPT works, try watching this concise 25 minute live demo showing how a dataset gets properly published and registered through GBIF.org ([download Video](http://videos.contentful.com/q553fnlofhvs/3iCjm4lxRSiCYE6Qq2A4GG/63b5690e48de42b0872ba4c25d629fe9/Introduction_to_publishing_using_the_GBIF_Integrated_Publishing_Toolkit__28IPT_29.mp4))

Read the [README.md](https://github.com/ChristianLanger/ipt/blob/master/README-ipt.md) to get all informations about the GBIF IPT.

### New features by APIs

APIs enhances the GBIF IPT with a new designed interface and new functionalities having an improved user interface for storing and publishing biodiversity data through GBIF.

Major features include:

* **New fresh design and branding** - The modern, responsive design based on Bootstrap is clear structured and supports most of the new web technologies like Bootstrap Modal, Collapse, Jquery easing etc.
* **Font Awesome** - No more old niffy gif icons. Most of the icons were replaced with Font awesome icons
* **Animate CSS** - APIs includes the awesome just-add-water CSS animations for animated content
* **Public user registration** - The user registration is simplified. Users are able to register public without contacting the IPT administrator. New user can choose between "Manager with registration rights" or "Manager without registration rights" as a default role.


### Get started

The simplest way to begin using the IPT is installing Apache Tomcat on your server or local machine. GBIF offers a useful installation guide (check [GBIF Wiki](https://github.com/gbif/ipt/wiki/IPTServerPreparation.wiki)) to install Apache Tomcat on every OS.

After successfully installed Tomcat on your system you need to deploy the web application archive file (.war file) of APIs in this Java servlet container. <br>Download the `ipt-apis.war` file directly [here](https://github.com/ChristianLanger/ipt/blob/master/ipt-apis.war) or create the war file using the following bash command in the webapp folder. 

`jar -cvf ipt-apis.war *`

After deploying the .war file your web application will be listed in your Tomcat Web Application Manager. If you have used your local machine for the IPT installation you can reach the application via `localhost:8080/ipt` in your web browser.
That´s it! You are now ready to use APIs!

### More screenshots

![Screenshot](http://home.uni-leipzig.de/idiv/ipt/screenshots/screen2.png)
![Screenshot](http://home.uni-leipzig.de/idiv/ipt/screenshots/screen3.png)
![Screenshot](http://home.uni-leipzig.de/idiv/ipt/screenshots/screen4.png)

