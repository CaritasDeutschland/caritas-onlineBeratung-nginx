pipeline {
	agent any
	environment {
	    ARTIFACT_TAG = "${BRANCH_NAME}-${BUILD_ID}"
    }
	stages {
 	    stage('Docker build') {
        	steps {
        		echo 'Creating Docker Container..'
        		sh 'docker build --no-cache -t ${DOCKER_REGISTRY}/${ARTIFACT_GROUP}/${ARTIFACT_NAME_NGINX} .'
        	}
        }
        stage('Docker push') {
        	agent any
        	steps {
        		echo 'Pushing Docker Container to repository..'
        		script {
                    docker.withRegistry(DOCKER_REGISTRY_URL, DOCKER_REGISTRY_CREDENTIALS_ID) {
                        docker.image("${DOCKER_REGISTRY}/${ARTIFACT_GROUP}/${ARTIFACT_NAME_NGINX}").push('${ARTIFACT_TAG}')
                    }
                }
        	}
        }
    }
}