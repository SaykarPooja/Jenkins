1.GitHub Setup

Create a folder named vars (Jenkins automatically looks for shared library scripts here).

Save your shared library functions inside this folder.

Each function must be saved with a .groovy extension.

repository-name
 └── vars
      └── helloWorld.groovy



2.Jenkins Configuration


Jenkins->Manage Jenkins → System → Global Untrusted Pipeline Libraries


Library Name: Must match the name used in the Jenkins pipeline.

Default Version: Branch name (e.g., main or master).

Git URL: The repository that contains the vars folder and shared library code.


                            
                            
📌 Important Notes

The library name must match exactly with the name used in your Jenkinsfile.

In your Jenkins pipeline, include the library using(L capital):

  @Library("shared_library_name") _
                            

