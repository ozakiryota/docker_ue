# docker_ue
## Requirements
* Docker
## Installation
1. Create UE account at https://www.unrealengine.com
2. Connect your github account with UE at https://www.epicgames.com/account/connections
3. `git clone https://github.com/ozakiryota/docker_ue.git`
4. Download zip from https://github.com/EpicGames/UnrealEngine.git, and put it copy/UnrealEngine-4.26.zip  
   or  
   `cd docker_ue/copy && git clone git@github.com:EpicGames/UnrealEngine.git -b 4.26`
5. `chmod 755 ./*.sh`
6. `./build.sh`
## Usage
`./run.sh`
## Reference
* https://docs.unrealengine.com/4.27/ja/SharingAndReleasing/Linux/BeginnerLinuxDeveloper/SettingUpAnUnrealWorkflow/
## Note
Parallel compilation (e.g. `make -j $(($(nproc) / 2))`) for UE causes error.