Configuration SetSystemLocale
{
   param
   (
       [String[]] $NodeName = $env:COMPUTERNAME,

       [Parameter(Mandatory = $true)]
       [ValidateNotNullorEmpty()]
       [String] $SystemLocale
   )

   Import-DSCResource -ModuleName SystemLocaleDsc

   Node $NodeName
   {
        SystemLocale SystemLocaleExample
        {
            IsSingleInstance = 'Yes'
            SystemLocale     = $SystemLocale
        }
   }
}

SetSystemLocale -NodeName 'localhost' -SystemLocale 'ja-JP'
Start-DscConfiguration -Path .\SetSystemLocale -Wait -Verbose -Force
