#include <aws/core/Aws.h>
#include <aws/s3/S3Client.h>

#include <arrow/status.h>
#include <arrow/filesystem/s3fs.h>

int main(int argc, char** argv) {
    auto globalOption = arrow::fs::S3GlobalOptions{};
    arrow::fs::InitializeS3(globalOption).ok();
    arrow::fs::FinalizeS3().ok();
}