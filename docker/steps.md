## <u> Docker steps</u> 🐋

<p>Steps to launch all the usefull containers. Don't forget to securise them !</p>

#### requirement :
- jdk-11.0.10_linux-x64_bin.deb
- wildfly-preview-23.0.2.Final.zip
- mongodb ?
<br>


### Mongodb container (Dev) 🌱
📁 into the "mongodb" directory
```bash 
docker build -t mongodb-dev dev/
docker run -p 5430:5432/tcp --name mongodb-dev -e MONGO_PASSWORD=<my-password> -d mongodb-dev
```

<br>

### Wildfly 23.0.2.Final server ☕
📁 into the "docker" directory

```bash 
docker build -t wildfly23 wildfly23/
#expose web application
docker run -p 8180:8080 --name wildflycoco -d wildfly23
#expose web application & wildfly admin interface 
docker run -p 8180:8080 -p 9990:9990 --name wildflycoco -d wildfly23
#expose web application and launch standalone.xml with the wildfly name version
docker run -p 8180:8080 --name wildflycoco -d wildfly23 /opt/jboss/wildfly-preview-23.0.2.Final/bin/standalone.sh -b 0.0.0.0 -bmanagement 0.0.0.0
```

.1 **Postgres driver installation :** 
- _(Optional)_ change module name in the **module.xml** file (by default postgresql-42.2.20.jar)
- copy the file postgresql module **.jar** in _/org/postgresql/main/_ (by default postgresql-42.2.20.jar)
- copy the file **module.xml** in _/org/postgresql/main/_

**standalone.xml configuration for the datasources :** xa-datasource
```xml
<subsystem xmlns="urn:jboss:domain:datasources:6.0">
    <datasources>
        <xa-datasource jndi-name="java:jboss/jdbc/COCO_DS" pool-name="CocoDSDev" enabled="true" use-java-context="true" spy="true">
            <xa-datasource-property name="ServerName">
                <!--ip-->
            </xa-datasource-property>
            <xa-datasource-property name="PortNumber">
                <!--port-->
            </xa-datasource-property>
            <xa-datasource-property name="DatabaseName">
                <!--database-->
            </xa-datasource-property>
            <driver>postgresql</driver>
            <transaction-isolation>TRANSACTION_REPEATABLE_READ</transaction-isolation>
            <security>
                <user-name><!--user--></user-name>
                <password><!--password--></PASSWORD>
            </security>
            <validation>
                <valid-connection-checker class-name="org.jboss.jca.adapters.jdbc.extensions.postgres.PostgreSQLValidConnectionChecker"/>
                <exception-sorter class-name="org.jboss.jca.adapters.jdbc.extensions.postgres.PostgreSQLExceptionSorter"/>
            </validation>
        </xa-datasource>
    </datasources>
</subsystem>
```
<br>
<br>

*Usefull :*
```bash 
#check
docker images #check images
docker ps # container list
docker ps -a # container history
docker container ls 

#build
docker build -t <image-name>

#debug containers
docker run -it -p 8180:8080 --name wildflycoco -d wildfly23
docker exec -it wildfly /bin/bash

#remove
docker image rm -f <image-name> #remove image with force
docker rmi -f <image-id> #remove image
```
