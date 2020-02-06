pipeline {
	agent any
	environment {
		ARTIFACT_GROUP = "caritas-online-beratung"
        ARTIFACT_NAME = "nginx"
        ARTIFACT_TAG = "${BRANCH_NAME}-${BUILD_ID}"
        DOCKER_REPOSITORY_URL = "viartifacts-docker.jfrog.io"
    }
	stages {
 	    stage('Docker build') {
        	steps {
        		echo 'Creating Docker Container..'
        		sh 'docker build --no-cache -t ${DOCKER_REPOSITORY_URL}/${ARTIFACT_GROUP}/${ARTIFACT_NAME} .'
        	}
        }
        stage('Docker push') {
        	agent any
        	steps {
        		echo 'Pushing Docker Container to repository..'
        		script {
                    docker.withRegistry('https://viartifacts-docker.jfrog.io', 'artifactory-credentials') {
                        docker.image("${DOCKER_REPOSITORY_URL}/${ARTIFACT_GROUP}/${ARTIFACT_NAME}").push('${ARTIFACT_TAG}')
                    }
                }
        	}
        }
    }
}