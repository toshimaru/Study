using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Security.Cryptography;

namespace ConsoleApplication
{
    class PublicKeyEncryption
    {
        static void Main(string[] args)
        {
            string str = "secret";

            string publicKey, privateKey;
            CreateKeys(out publicKey, out privateKey);

            string encryptedStr = Encrypt(str, publicKey);
            Console.WriteLine(encryptedStr);

            string decryptedStr = Decrypt(encryptedStr, privateKey);
            Console.WriteLine(decryptedStr);

            Console.Read();
        }

        /// <summary>
        /// 公開鍵と秘密鍵を作成して返す
        /// </summary>
        /// <param name="publicKey">作成された公開鍵(XML形式)</param>
        /// <param name="privateKey">作成された秘密鍵(XML形式)</param>
        static void CreateKeys(out string publicKey, out string privateKey)
        {
            RSACryptoServiceProvider rsa = new RSACryptoServiceProvider();

            publicKey = rsa.ToXmlString(false);
            privateKey = rsa.ToXmlString(true);
        }

        /// <summary>
        /// 公開鍵を使って文字列を暗号化する
        /// </summary>
        /// <param name="str">暗号化する文字列</param>
        /// <param name="publicKey">暗号化に使用する公開鍵(XML形式)</param>
        /// <returns>暗号化された文字列</returns>
        static string Encrypt(string str, string publicKey)
        {
            RSACryptoServiceProvider rsa = new RSACryptoServiceProvider();

            rsa.FromXmlString(publicKey);

            byte[] data = Encoding.UTF8.GetBytes(str);
            byte[] encryptedData = rsa.Encrypt(data, true);

            return Convert.ToBase64String(encryptedData);
        }

        /// <summary>
        /// 秘密鍵を使って文字列を復号化する
        /// </summary>
        /// <param name="str">Encryptメソッドにより暗号化された文字列</param>
        /// <param name="privateKey">復号化に必要な秘密鍵(XML形式)</param>
        /// <returns>復号化された文字列</returns>
        static string Decrypt(string str, string privateKey)
        {
            RSACryptoServiceProvider rsa = new RSACryptoServiceProvider();

            rsa.FromXmlString(privateKey);

            byte[] data = Convert.FromBase64String(str);
            byte[] decryptedData = rsa.Decrypt(data, true);

            return Encoding.UTF8.GetString(decryptedData);
        }
    }
}
