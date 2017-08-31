-- -*- lua -*-
-- Written by MC on 8/31/2017
help(
[[
This module sets up EPACTS container running Ubuntu 16.04.

]])

load("singularity")
local PVPATH="/uufs/chpc.utah.edu/sys/installdir/epacts/3.3.0-singularity"

--set_alias("startparaview","singularity shell -s /bin/bash -B /scratch,/uufs/chpc.utah.edu " .. PVPATH .. "/ubuntu_paraview.img")
--set_alias("paraview","singularity exec -B /scratch,/uufs/chpc.utah.edu " .. PVPATH .. "/ubuntu_biobakery.img paraview")

-- singularity environment variables to bind the paths and set shell
setenv("SINGULARITY_BINDPATH","/scratch,/uufs/chpc.utah.edu")
setenv("SINGULARITY_SHELL","/bin/bash")
-- shell function to provide "alias" to the seqlink commands, as plain aliases don't get exported to bash non-interactive shells by default
set_shell_function("epacts",'singularity exec' .. PVPATH .. '/ubuntu_epacts.img "$@"',"singularity exec " .. PVPATH .. "/ubuntu_epacts.img $*")
-- to export the shell function to a subshell
if (myShellName() == "bash") then
 execute{cmd="export -f epacts",modeA={"load"}}
end

whatis("Name        : EPACTS (Efficient and Parallelizable Association Container Toolbox)")
whatis("Version     : 3.3.0")
whatis("Category    : versatile software pipeline to perform various statistical tests for identifying genome-wide association from sequence data")
whatis("URL         : https://genome.sph.umich.edu/wiki/EPACTS")
