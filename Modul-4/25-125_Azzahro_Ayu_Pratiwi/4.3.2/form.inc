<form action="" method="post">
    <div class="field">
        <label for="username">Username</label>
        <input type="text" name="username" id="username"
            value="<?php echo htmlspecialchars($_POST['username'] ?? ''); ?>">
    </div>
    <div class="field">
        <label for="email">Email</label>
        <input type="email" name="email" id="email"
            value="<?php echo htmlspecialchars($_POST['email'] ?? ''); ?>">
    </div>
    <div class="field">
        <label for="password">Password</label>
        <input type="password" name="password" id="password"
            value="<?php echo htmlspecialchars($_POST['password'] ?? ''); ?>">
    </div>
    <div class="field">
        <label for="addres">Alamat</label>
        <textarea name="addres" id="addres"><?php
            echo htmlspecialchars($_POST['addres'] ?? '');
        ?></textarea>
    </div>
    <div class="field">
        <label for="state">Provinsi</label>
        <select name="state" id="state">
            <option value="">[pilih provinsimu]</option>
            <option value="1" <?php if (($_POST['state'] ?? '') == '1') echo 'selected'; ?>>Jawa Timur</option>
            <option value="2" <?php if (($_POST['state'] ?? '') == '2') echo 'selected'; ?>>Jawa Tengah</option>
            <option value="3" <?php if (($_POST['state'] ?? '') == '3') echo 'selected'; ?>>Jawa Barat</option>
            <option value="4" <?php if (($_POST['state'] ?? '') == '4') echo 'selected'; ?>>DKI Jakarta</option>
            <option value="5" <?php if (($_POST['state'] ?? '') == '5') echo 'selected'; ?>>DI Yogyakarta</option>
            <option value="6" <?php if (($_POST['state'] ?? '') == '6') echo 'selected'; ?>>Banten</option>
        </select>
    </div>
    <div class="field">
        <input type="hidden" name="country" value="Indonesia">
    </div>
    <div class="field">
        <label>Jenis Kelamin</label>
        <div>
            <input type="radio" name="gender" id="male" value="male"
                <?php if (($_POST['gender'] ?? '') == 'male') echo 'checked'; ?>>
            <label for="male">Laki-laki</label>

            <input type="radio" name="gender" id="female" value="female"
                <?php if (($_POST['gender'] ?? '') == 'female') echo 'checked'; ?>>
            <label for="female">Perempuan</label>
        </div>
    </div>
    <div class="field">
        <label for="vegetarian">Vegetarian?</label>
        <input type="checkbox" name="vegetarian" id="vegetarian" value="yes"
            <?php if (($_POST['vegetarian'] ?? '') == 'yes') echo 'checked'; ?>>
    </div>
    <div class="field">
        <label>&nbsp;</label>
        <input type="submit" name="submit" value="Submit">
        <input type="reset" name="reset" value="Reset">
    </div>
</form>