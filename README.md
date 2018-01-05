## Welcome to APIs! 

APIs is a customized Integrated Publishing Toolkit (IPT).<br>
APIs is your infrastructure for data management helping researchers and scientists to organise, store, access, visualise, share and publish biodiversity data through the Global Biodiversity Information Facility (GBIF) easily. APIs is build with the IPT Version 2.3.4 and comes with a new fresh design and improved functionalities. 

![Screenshot](http://home.uni-leipzig.de/idiv/ipt/screenshots/screen1.png) 

### About the GBIF IPT

The IPT is a free open source software tool written in Java that is used to publish and share biodiversity datasets through the GBIF network. The IPT can also be configured with either a DataCite or EZID account in order to assign DOIs to datasets transforming it into a data repository. 

To understand how the IPT works, try watching this concise 25 minute live demo showing how a dataset gets properly published and registered through GBIF.org ([download Video](http://videos.contentful.com/q553fnlofhvs/3iCjm4lxRSiCYE6Qq2A4GG/63b5690e48de42b0872ba4c25d629fe9/Introduction_to_publishing_using_the_GBIF_Integrated_Publishing_Toolkit__28IPT_29.mp4))


### New features by APIs

APIs enhances the original IPT with a new design and new functionalities to have a more user friendly interface for storing and publishing biodiversity data through GBIF.

* **New fresh design and branding** - The modern, responsive design based on Bootstrap is clear structured and supports most of the new web technologies like Bootstrap Modal, Collapse, Jquery easing etc.
* **Font Awesome** - No more old niffy gif icons. Most of the icons were replaced with Font awesome icons
* **Animate CSS** - APIs includes the awesome just-add-water CSS animations
* **Public user registration** - The user registration is simplified. Users are able to register public without contacting the IPT administrator. The default role for each user is "Manager with/without registration rights"


### Get started

The simplest way to begin using the IPT is installing Apache Tomcat on your server or local machine. GBIF offers a useful installation guide [GBIF Wiki](https://github.com/gbif/ipt/wiki/IPTServerPreparation.wiki) to install Tomcat on your system.

After you have successfully installed Tomcat on your system you need to deploy the .war file in the Java servlet container. Download the ipt-apis.war file directly [here](https://github.com/ChristianLanger/ipt/blob/master/ipt-apis.war) or run the bash command in the webapp folder. 

`jar -cvf ipt-apis.war *`

After you have deployed the .war file in your java servlet container your application will be listed in your Tomcat Web Application Manager. If you have used your local machine for installation call `localhost:8080/ipt` in your web browser.
That´s it you are now ready to use APIs!

### More screenshots

![Screenshot](http://home.uni-leipzig.de/idiv/ipt/screenshots/screen2.png)
![Screenshot](http://home.uni-leipzig.de/idiv/ipt/screenshots/screen3.png)
![Screenshot](http://home.uni-leipzig.de/idiv/ipt/screenshots/screen4.png)

