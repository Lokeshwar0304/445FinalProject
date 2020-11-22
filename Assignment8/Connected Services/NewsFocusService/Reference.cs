﻿//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated by a tool.
//     Runtime Version:4.0.30319.42000
//
//     Changes to this file may cause incorrect behavior and will be lost if
//     the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace Assignment8.NewsFocusService {
    
    
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.ServiceModel", "4.0.0.0")]
    [System.ServiceModel.ServiceContractAttribute(ConfigurationName="NewsFocusService.IService")]
    public interface IService {
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/IService/GetNewsFocus", ReplyAction="http://tempuri.org/IService/GetNewsFocusResponse")]
        string[] GetNewsFocus(string topics);
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/IService/GetNewsFocus", ReplyAction="http://tempuri.org/IService/GetNewsFocusResponse")]
        System.Threading.Tasks.Task<string[]> GetNewsFocusAsync(string topics);
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/IService/getWeatherResults", ReplyAction="http://tempuri.org/IService/getWeatherResultsResponse")]
        string[] getWeatherResults(string zipcode);
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/IService/getWeatherResults", ReplyAction="http://tempuri.org/IService/getWeatherResultsResponse")]
        System.Threading.Tasks.Task<string[]> getWeatherResultsAsync(string zipcode);
    }
    
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.ServiceModel", "4.0.0.0")]
    public interface IServiceChannel : Assignment8.NewsFocusService.IService, System.ServiceModel.IClientChannel {
    }
    
    [System.Diagnostics.DebuggerStepThroughAttribute()]
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.ServiceModel", "4.0.0.0")]
    public partial class ServiceClient : System.ServiceModel.ClientBase<Assignment8.NewsFocusService.IService>, Assignment8.NewsFocusService.IService {
        
        public ServiceClient() {
        }
        
        public ServiceClient(string endpointConfigurationName) : 
                base(endpointConfigurationName) {
        }
        
        public ServiceClient(string endpointConfigurationName, string remoteAddress) : 
                base(endpointConfigurationName, remoteAddress) {
        }
        
        public ServiceClient(string endpointConfigurationName, System.ServiceModel.EndpointAddress remoteAddress) : 
                base(endpointConfigurationName, remoteAddress) {
        }
        
        public ServiceClient(System.ServiceModel.Channels.Binding binding, System.ServiceModel.EndpointAddress remoteAddress) : 
                base(binding, remoteAddress) {
        }
        
        public string[] GetNewsFocus(string topics) {
            return base.Channel.GetNewsFocus(topics);
        }
        
        public System.Threading.Tasks.Task<string[]> GetNewsFocusAsync(string topics) {
            return base.Channel.GetNewsFocusAsync(topics);
        }
        
        public string[] getWeatherResults(string zipcode) {
            return base.Channel.getWeatherResults(zipcode);
        }
        
        public System.Threading.Tasks.Task<string[]> getWeatherResultsAsync(string zipcode) {
            return base.Channel.getWeatherResultsAsync(zipcode);
        }
    }
}