using System;
using System.Collections.Generic;
using System.Linq;
using System.IO;
using System.Security.Cryptography;
using System.Text;

namespace ConsoleApplication
{
    class SymmetricKeyCryptography
    {
        static void Main(string[] args)
        {
            try
            {
                string str = "secret";
                string key = "popopopooon";

                var myAes = new AesManaged();
                byte[] encrypted = EncryptStringToBytes_Aes(str, key);

                string result = BitConverter.ToString(encrypted).ToLower().Replace("-", "");
                Console.WriteLine(result);

                string decrypted = DecryptStringFromBytes_Aes(encrypted, key);
                Console.WriteLine(decrypted);
            }
            catch (Exception e)
            {
                Console.WriteLine("Error: {0}", e.Message);
            }

            Console.Read();
        }

        //平文から暗号化バイト配列を生成して返す
        static byte[] EncryptStringToBytes_Aes(string str,string password)
        {
            if (string.IsNullOrEmpty(str))
                throw new ArgumentNullException("plainText");
            if (password == null || password.Length <= 0)
                throw new ArgumentNullException("key");

            byte[] encrypted;
            using (AesManaged aesAlg = new AesManaged())
            {
                byte[] key, iv;
                GenerateKeyFromPassword(password, aesAlg.KeySize, out key, aesAlg.BlockSize, out iv);
                aesAlg.Key = key;
                aesAlg.IV = iv;

                ICryptoTransform encryptor = aesAlg.CreateEncryptor(aesAlg.Key, aesAlg.IV);
                using (MemoryStream msEncrypt = new MemoryStream())
                {
                    using (CryptoStream csEncrypt = new CryptoStream(msEncrypt, encryptor, CryptoStreamMode.Write))
                    {
                        using (StreamWriter swEncrypt = new StreamWriter(csEncrypt))
                        {
                            swEncrypt.Write(str);
                        }
                        encrypted = msEncrypt.ToArray();
                    }
                }
            }

            return encrypted;
        }

        /// <summary>
        /// ファイルを復号化する
        /// </summary>
        /// <param name="sourceFile">暗号化したバイト配列</param>
        /// <param name="password">暗号化に使用したパスワード</param>
        public static string DecryptStringFromBytes_Aes(byte[] encrypted, string password)
        {
            if (password == null || password.Length <= 0)
                throw new ArgumentNullException("key");

            string decrypted;
            using (AesManaged aesAlg = new AesManaged())
            {
                byte[] key, iv;
                GenerateKeyFromPassword(password, aesAlg.KeySize, out key, aesAlg.BlockSize, out iv);
                aesAlg.Key = key;
                aesAlg.IV = iv;

                // Create a decrytor to perform the stream transform.
                ICryptoTransform decryptor = aesAlg.CreateDecryptor(aesAlg.Key, aesAlg.IV);

                // Create the streams used for decryption.
                using (MemoryStream msDecrypt = new MemoryStream(encrypted))
                {
                    using (CryptoStream csDecrypt = new CryptoStream(msDecrypt, decryptor, CryptoStreamMode.Read))
                    {
                        using (StreamReader srDecrypt = new StreamReader(csDecrypt))
                        {

                            // Read the decrypted bytes from the decrypting stream
                            // and place them in a string.
                            decrypted = srDecrypt.ReadToEnd();
                        }
                    }
                }

            }

            return decrypted;
        }

        //パスワードから共有キーと初期化ベクタを作成する
        private static void GenerateKeyFromPassword(string password, int keySize, out byte[] key, int blockSize, out byte[] iv)
        {
            byte[] salt = System.Text.Encoding.UTF8.GetBytes("saltは必ず8バイト以上");
            PasswordDeriveBytes deriveBytes = new PasswordDeriveBytes(password, salt);

            //反復処理回数を指定する デフォルトで1000回
            deriveBytes.IterationCount = 1000;

            //共有キー¨初期化ベクタを生成する
            key = deriveBytes.GetBytes(keySize / 8);
            iv = deriveBytes.GetBytes(blockSize / 8);
        }
    }
}
