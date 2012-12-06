#
# Cookbook Name::       mongodb
# Description::         Base configuration for mongodb
# Recipe::              default
# Author::              brandon.bell
#
# Copyright 2011, Chris Howe - Infochimps, Inc
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


#
# Create MondoDB user 
#

if node[:mongodb][:server] # Only need user for servers
  user node[:mongodb][:user] do
    group node[:mongodb][:group]
    action :create
    system true
    shell "/bin/false"
  end
end
