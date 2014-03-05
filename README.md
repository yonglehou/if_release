Ironfoundry Release
==========

### To build an IronFoundry Warden/DEA release package on a dev machine:
* Ensure all prerequisites are installed:
  * Git
  * Go
* Start a Powershell console with elevated privileges (required for some Warden tests)
* Run .\ironfoundry_build.bat to build the release package
* The resulting release package is at ./release/ironfoundry_cfmaster.exe

### To install a IronFoundry Warden/DEA release package on a Windows server:
* Execute the ironfoundry_cfmaster.exe self-extracting archive on the server
* If the server is clean, run install-prerequisites.ps1 to install the Ironfoundry prerequisites.  If you ran the script from a Powershell console, restart the console to pick up the new environment variables.
* Run ironfoundry-install.ps1 to install the Windows DEA and Warden.

### To register the CLR stack with the Cloud Controller:
* SSH to your cloud controller server
* Edit /var/vcap/jobs/cloud_controller_ng/stacks.yml
* Add these two lines to register the CLR stack:
```
- name: mswin-clr
  description: Microsoft .NET / Windows 64-bit
```
* Restart the cloud controller

### To push a Windows application:
* `cf push myapp -s mswin-clr`
