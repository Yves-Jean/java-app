FROM openjdk:11

COPY target/*.jar /usr/src/app

RUN rm -rf /usr/src/app

# CMD ["java", "./org/springframework/samples/petclinic/PetClinicApplication.java"]
ENTRYPOINT ["java","-jar","./*.jar"]