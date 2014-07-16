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
        /// ���J���Ɣ閧�����쐬���ĕԂ�
        /// </summary>
        /// <param name="publicKey">�쐬���ꂽ���J��(XML�`��)</param>
        /// <param name="privateKey">�쐬���ꂽ�閧��(XML�`��)</param>
        static void CreateKeys(out string publicKey, out string privateKey)
        {
            RSACryptoServiceProvider rsa = new RSACryptoServiceProvider();

            publicKey = rsa.ToXmlString(false);
            privateKey = rsa.ToXmlString(true);
        }

        /// <summary>
        /// ���J�����g���ĕ�������Í�������
        /// </summary>
        /// <param name="str">�Í������镶����</param>
        /// <param name="publicKey">�Í����Ɏg�p������J��(XML�`��)</param>
        /// <returns>�Í������ꂽ������</returns>
        static string Encrypt(string str, string publicKey)
        {
            RSACryptoServiceProvider rsa = new RSACryptoServiceProvider();

            rsa.FromXmlString(publicKey);

            byte[] data = Encoding.UTF8.GetBytes(str);
            byte[] encryptedData = rsa.Encrypt(data, true);

            return Convert.ToBase64String(encryptedData);
        }

        /// <summary>
        /// �閧�����g���ĕ�����𕜍�������
        /// </summary>
        /// <param name="str">Encrypt���\�b�h�ɂ��Í������ꂽ������</param>
        /// <param name="privateKey">�������ɕK�v�Ȕ閧��(XML�`��)</param>
        /// <returns>���������ꂽ������</returns>
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
