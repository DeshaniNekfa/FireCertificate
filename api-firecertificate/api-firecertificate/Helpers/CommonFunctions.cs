using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Text.RegularExpressions;
using System.Web;

namespace api_rate.Helpers
{
    public class CommonFunctions
    {

        // Validate whether telephone number contains only digits
        public bool ValidatePhoneNoDigits(string strInput)
        {
            foreach (char character in strInput)
            {
                if (character < '0' || character > '9')
                {
                    return false;
                }
            }
            return true;
        }

        // Validate Email
        public bool IsValidEmail(string strEmail)
        {
            bool isValidEmail = Regex.IsMatch(strEmail, @"\A(?:[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?)\Z", RegexOptions.IgnoreCase);
            return isValidEmail;
        }

        // Validate Date
        public bool IsValidDate(string strDate)
        {
            try
            {
                DateTime.ParseExact(strDate, "yyyy/MM/dd HH:mm", CultureInfo.InvariantCulture);
                return true;
            }
            catch (Exception ex)
            {
                var txt = ex.Message;
                return false;
            }
        }

        // Validate Decimal Number 
        public bool IsValidDecimalNo(string strValue)
        {
            bool IsValid = false;
            try
            {
                if (strValue.Contains(".") == true)
                {

                    int intEndIndex = strValue.Trim().IndexOf('.');
                    string strFirst = strValue.Substring(0, intEndIndex).Trim();
                    string strSecond = strValue.Substring(intEndIndex + 1).Trim();

                    if (ValidatePhoneNoDigits(strFirst) == false || ValidatePhoneNoDigits(strSecond) == false)
                    {
                        IsValid = false;
                    }
                    else
                    {
                        IsValid = true;
                    }
                }
                else
                {
                    if (ValidatePhoneNoDigits(strValue) == false)
                    {
                        IsValid = false;
                    }
                    else
                    {
                        IsValid = true;
                    }
                }

            }
            catch (Exception)
            {
                IsValid = false;
            }

            return IsValid;
        }

    }
}