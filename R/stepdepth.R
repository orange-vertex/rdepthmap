# Copyright 2019 Petros Koutsolampros
#
# This file is part of rdepthmap
#
# rdepthmap is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# rdepthmap is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with rdepthmap  If not, see <https://www.gnu.org/licenses/>.

stepdepth = function(graphFileIn, graphFileOut = NA, depthType, fromX, fromY,
                     cliPath = getDefaultCLILocation(), verbose = FALSE) {

  if (!(depthType %in% c("metric", "angular", "visual"))) {
    stop(paste0("Unknown depthType: ", depthType))
  }

  tmpPtz = makeTempPointFile(fromX, fromY);

  params = c("-f", formatForCLI(graphFileIn),
             "-o", formatForCLI(graphFileOut),
             "-m", "STEPDEPTH",
             "-sdt", depthType,
             "-sdf", formatForCLI(tmpPtz));
  depthmapXcli(params, cliPath, verbose);
  invisible(file.remove(tmpPtz));
}
