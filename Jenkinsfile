// Define job parameters
properties([
    parameters([
        string(name: 'INSTANCE_COUNT', defaultValue: '2', description: 'Number of EC2 instances to create')
    ])
])

node {
    // Define branch name as a Groovy variable (fixed to string)
    def branchName = "main"

    stage('Show Branch') {
        echo "Currently building branch: ${branchName}"
    }
    stage('Clean Workspace') {
        // Deletes everything in the current workspace
        deleteDir()
        echo "Workspace cleaned successfully!"
    }
    stage('Checkout') {
        sh 'rm -rf * .git' 
        git branch: branchName, url: 'https://github.com/anjibabu006/terraform-jenkins.git'
    }

    stage('Terraform Init') {
        // Use branchName variable directly
        sh """
          terraform init \
          -backend-config="key=terraform/${branchName}/terraform.tfstate" \
          -reconfigure
        """
    }

    stage('Check Tools') {
        // Check Terraform and AWS CLI installation
        sh '''
          if ! command -v terraform &> /dev/null
          then
            echo "❌ Terraform is not installed!"
            exit 1
          else
            echo "✅ Terraform version:"
            terraform version
          fi

          if ! command -v aws &> /dev/null
          then
            echo "❌ AWS CLI is not installed!"
            exit 1
          else
            echo "✅ AWS CLI version:"
            aws --version
          fi
        '''
    }

    stage('Terraform Plan') {
        sh "terraform plan -var instance_count=${params.INSTANCE_COUNT} -var workflow_name=${branchName} -out=tfplan"
    }

//    stage('Approval') {
   //     input message: "Approve Terraform Apply for job ${env.JOB_NAME}?", ok: "Apply"
    //}

    stage('Terraform Apply') {
        sh "terraform apply -auto-approve tfplan"
    }
}
