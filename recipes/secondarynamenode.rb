#
# Cookbook Name::       hadoop_cluster
# Description::         Secondarynamenode
# Recipe::              secondarynamenode
# Author::              Philip (flip) Kromer - Infochimps, Inc
#
# Copyright 2009, Opscode, Inc.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

include_recipe "hadoop_cluster"

# Install
hadoop_package "secondarynamenode"

# launch service
service "#{node[:hadoop][:handle]}-secondarynamenode" do
  action    node[:hadoop][:secondarynamenode][:service_state]
  supports :status => true, :restart => true
  ignore_failure true
end

provide_service ("#{node[:cluster_name]}-secondarynamenode")

dfs_2nn_dirs.each do |dir|
  make_hadoop_dir(dir, 'hdfs',   "0700")
end
