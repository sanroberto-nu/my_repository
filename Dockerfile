FROM daggerok/jboss-eap-7.2:7.2.0-centos

ENV JAVA_OPTS -XX:MetaspaceSize=1g -XX:MaxMetaspaceSize=1g -XX:CompressedClassSpaceSize=1g

COPY standalone-prod.xml /home/jboss/jboss-eap-7.2/standalone/configuration/standalone-prod.xml
COPY identity.jks /home/jboss/jboss-eap-7.2/standalone/configuration/identity.jks
RUN sudo chown jboss:jboss /home/jboss/jboss-eap-7.2/standalone/configuration/identity.jks
COPY truststore.jks /home/jboss/jboss-eap-7.2/standalone/configuration/truststore.jks
RUN sudo chown jboss:jboss /home/jboss/jboss-eap-7.2/standalone/configuration/truststore.jks

COPY jhipster-registry-3.2.4.war /home/jboss/jboss-eap-7.2/standalone/deployments/jhipster-registry-3.2.4.war
COPY gateway-0.0.1-SNAPSHOT.war /home/jboss/jboss-eap-7.2/standalone/deployments/gateway-0.0.1-SNAPSHOT.war
COPY profiling-0.0.1-SNAPSHOT.war /home/jboss/jboss-eap-7.2/standalone/deployments/profiling-0.0.1-SNAPSHOT.war
COPY anag-0.0.1-SNAPSHOT.war /home/jboss/jboss-eap-7.2/standalone/deployments/anag-0.0.1-SNAPSHOT.war
COPY offer-0.0.1-SNAPSHOT.war /home/jboss/jboss-eap-7.2/standalone/deployments/offer-0.0.1-SNAPSHOT.war
COPY profiling-0.0.1-SNAPSHOT.war /home/jboss/jboss-eap-7.2/standalone/deployments/profiling-0.0.1-SNAPSHOT.war
COPY psale-0.0.1-SNAPSHOT.war /home/jboss/jboss-eap-7.2/standalone/deployments/psale-0.0.1-SNAPSHOT.war
COPY integ-0.0.1-SNAPSHOT.war /home/jboss/jboss-eap-7.2/standalone/deployments/integ-0.0.1-SNAPSHOT.war


COPY oracle.zip /home/jboss/jboss-eap-7.2/modules
RUN unzip /home/jboss/jboss-eap-7.2/modules/oracle.zip -d /home/jboss/jboss-eap-7.2/modules/

#COPY oracle-instantclient19.3-basic-19.3.0.0.0-1.x86_64.rpm /home/jboss/
#COPY oracle-instantclient19.3-sqlplus-19.3.0.0.0-1.x86_64.rpm /home/jboss/

USER jboss
ENTRYPOINT $JBOSS_HOME/bin/standalone.sh -c standalone-prod.xml -Dorg.jboss.metadata.parser.validate=true 







